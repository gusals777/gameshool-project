class FreematchController < ApplicationController
    
    def index
        
    end
    
    def add_team
      
      @Duplication_subscription_lol = TeamlistLol.where(:lol_current_user_id => current_user.id).take
      @Duplication_subscription_fifa = TeamlistFifa.where(:fifa_current_user_id => current_user.id).take
      @Duplication_subscription_hearthstone = TeamlistHearthstone.where(:hearthstone_current_user_id => current_user.id).take
        
    end
    
    def delete_team
      @whatkind = params[:kind_of_game]
      @teamlist_id = params[:teamlist_id]
      
      if @whatkind == "lol"
        
        @team_destroy = TeamlistLol.find(@teamlist_id)
        
        if @team_destroy.lol_current_user_id == current_user.id
          @team_destroy.destroy
        end
        
      elsif @whatkind == "fifa"
        @team_destroy = TeamlistFifa.find(@teamlist_id)
        
        if @team_destroy.fifa_current_user_id == current_user.id
          @team_destroy.destroy
        end
      else
        @team_destroy = TeamlistHearthstone.find(@teamlist_id)
        
        if @team_destroy.hearthstone_current_user_id == current_user.id
          @team_destroy.destroy
        end
        
      end  
    
      redirect_to "/freematch/team_list"
    end
    
    def team_list
        
        @teamlists_fifa = TeamlistFifa.all
        @teamlists_lol = TeamlistLol.all
        @teamlists_hearthstone = TeamlistHearthstone.all
        
        
        @bbb = TeamlistLol.where(:lol_current_user_id => params[:lol_whichgame_id]).take
        
                  
       
    end
    
    def team_list_write
        
      if params[:radio] == "fifa"
        
      # 피파 학과, 이름
        @teamlists = TeamlistFifa.new
        
        @teamlists.fifa_major = params[:fifa_major]
        @teamlists.fifa_user_name = params[:fifa_user_name]
        @teamlists.fifa_current_user_id = params[:fifa_current_user_id]
        
        @teamlists.game_id =  params[:fifa_game_id]
        @teamlists.tear = params[:fifa_tear]
        @teamlists.comment = params[:fifa_team_comment]
        
        @teamlists.save
        
      elsif params[:radio] == "hearthstone"


          @teamlists = TeamlistHearthstone.new
          
        # 하스스톤 학과, 이름
          @teamlists.hearthstone_major = params[:hearthstone_major]
          @teamlists.hearthstone_user_name = params[:hearthstone_user_name]
          @teamlists.hearthstone_current_user_id = params[:hearthstone_current_user_id]
          
          @teamlists.game_id = params[:hearthstone_game_id]
          @teamlists.tear = params[:hearthstone_tear]
          @teamlists.comment = params[:hearthstone_team_comment]
        
          @teamlists.save
          
      else
          
          @teamlists = TeamlistLol.new
          
        # 롤 소개멘트
          @teamlists.comment = params[:lol_team_comment]
          
        # 롤 학과
          @teamlists.lol_major = params[:lol_major]
          @teamlists.lol_member_major_1 = params[:lol_member_major_1]
          @teamlists.lol_member_major_2 = params[:lol_member_major_2]
          @teamlists.lol_member_major_3 = params[:lol_member_major_3]
          @teamlists.lol_member_major_4 = params[:lol_member_major_4]
          
        # 롤 팀명 
          @teamlists.lol_team_name = params[:lol_team_name]
          @teamlists.lol_current_user_id = params[:lol_current_user_id]
          
        # LoL Game Id DB
          @teamlists.lol_leader_id = params[:lol_leader_id]
          @teamlists.lol_user_id_1 = params[:lol_user_id_1]
          @teamlists.lol_user_id_2 = params[:lol_user_id_2]
          @teamlists.lol_user_id_3 = params[:lol_user_id_3]
          @teamlists.lol_user_id_4 = params[:lol_user_id_4]
          
        # LoL user Tear
          @teamlists.lol_leader_tear = params[:lol_leader_tear]
          @teamlists.lol_tear_user_1 = params[:lol_tear_user_1]
          @teamlists.lol_tear_user_2 = params[:lol_tear_user_2]
          @teamlists.lol_tear_user_3 = params[:lol_tear_user_3]
          @teamlists.lol_tear_user_4 = params[:lol_tear_user_4]
          
        # LoL  user name
          @teamlists.leader_name = params[:leader_name]
          @teamlists.lol_member_name_1 = params[:lol_member_name_1]
          @teamlists.lol_member_name_2 = params[:lol_member_name_2]
          @teamlists.lol_member_name_3 = params[:lol_member_name_3]
          @teamlists.lol_member_name_4 = params[:lol_member_name_4]
        
          @teamlists.save
      end
      
        redirect_to '/freematch/team_list'
    end
    
    def team_info
      
      @kind_of_game = params[:kind_of_game]
      
      if @kind_of_game == "fifa"
        
        @teamlists_fifa = TeamlistFifa.find(params[:id])
        
        @fifa_subscription_user = TeamlistFifa.where(:fifa_current_user_id => current_user.id).take
      
        @fifa_subscription_check = @teamlists_fifa.fightsubscription_fifas.where(:fifa_add_team_name_id => current_user.id).take
      
      elsif @kind_of_game == "lol"
      
        @teamlists_lol = TeamlistLol.find(params[:id])
        
        @lol_subscription_user = TeamlistLol.where(:lol_current_user_id => current_user.id).take
      
        @lol_subscription_check = @teamlists_lol.fightsubscriptions.where(:lol_add_team_name_id => current_user.id).take
        
      else
        @teamlists_hearthstone = TeamlistHearthstone.find(params[:id])
        
        @hearthstone_subscription_user = TeamlistHearthstone.where(:hearthstone_current_user_id => current_user.id).take
      
        @hearthstone_subscription_check = @teamlists_hearthstone.fightsubscription_hearthstones.where(:hearthstone_add_team_name_id => current_user.id).take
      end
    end
    


   # 대결신청 시 신청팀 저장 시킴
    def subscription_write
      
      if params[:kind_of_game] == "lol"  
        @lol_subscription_user = TeamlistLol.where(:lol_current_user_id => current_user.id).take
      
        @subscription = Fightsubscription.new
        @subscription.lol_subscription_team_name = @lol_subscription_user.lol_team_name
        @subscription.teamlist_lol_id = params[:teamlist_id]
        @subscription.lol_add_team_name_id = current_user.id
        @subscription.save
        
      elsif params[:kind_of_game] == "fifa"
        @fifa_subscription_user = TeamlistFifa.where(:fifa_current_user_id => current_user.id).take
      
        @subscription = FightsubscriptionFifa.new
        @subscription.fifa_user_name = @fifa_subscription_user.fifa_user_name
        @subscription.teamlist_fifa_id = params[:teamlist_id]
        @subscription.fifa_add_team_name_id = current_user.id
        @subscription.save
        
      else
        @hearthstone_subscription_user = TeamlistHearthstone.where(:hearthstone_current_user_id => current_user.id).take
      
        @subscription = FightsubscriptionHearthstone.new
        @subscription.hearthstone_user_name = @hearthstone_subscription_user.hearthstone_user_name
        @subscription.teamlist_hearthstone_id = params[:teamlist_id]
        @subscription.hearthstone_add_team_name_id = current_user.id
        @subscription.save
      end
        
       render :text => ""
        
    end
   # 대결신청 시 신청팀 저장 시킴 끝 
    
    def rank
        @teamlists_fifa = TeamlistFifa.all.sort()
        @teamlists_lol = TeamlistLol.all.sort()
        @teamlists_hearthstone = TeamlistHearthstone.all.sort()
        
        
        @rank_fifa_winner_point = TeamlistFifa.order(fifa_winner_point: :desc )    #피파승점
        @rank_fifa_total_game = TeamlistFifa.order(fifa_total_game: :desc)         #피파총경기수
        @rank_fifa_winning_rate = TeamlistFifa.order(fifa_winning_rate: :desc)     #피파승률
        @rank_fifa_lose = TeamlistFifa.order(fifa_lose: :desc)                     #피파트롤
        
         
        @rank_Heartstone_winner_point = TeamlistHearthstone.order(hearthstone_winner_point: :desc)     #하스승점
        @rank_Heartstone_total_game = TeamlistHearthstone.order(hearthstone_total_game: :desc)         #하스총경기수
        @rank_Heartstone_winning_rate = TeamlistHearthstone.order(hearthstone_winning_rate: :desc)     #하스승률
        @rank_Heartstone_lose = TeamlistHearthstone.order(hearthstone_lose: :desc)                     #하스트롤
        
         
        @rank_lol_winner_point = TeamlistLol.order(lol_winner_point: :desc)     #롤승점
        @rank_lol_total_game = TeamlistLol.order(lol_total_game: :desc)         #롤총경기수
        @rank_lol_winning_rate = TeamlistLol.order(lol_winning_rate: :desc)     #롤승률
        @rank_lol_lose = TeamlistLol.order(lol_lose: :desc)                     #롤트롤
        render layout: false
    end
   
    
    def total_ranking
        @teamlists_fifa = TeamlistFifa.all.sort()
        @teamlists_lol = TeamlistLol.all.sort()
        @teamlists_hearthstone = TeamlistHearthstone.all.sort()
        
        
        @rank_fifa_winner_point = TeamlistFifa.order(fifa_winner_point: :desc )     #피파승점
        @rank_fifa_total_game = TeamlistFifa.order(fifa_total_game: :desc)         #피파총경기수
        @rank_fifa_winning_rate = TeamlistFifa.order(fifa_winning_rate: :desc)     #피파승률
        @rank_fifa_lose = TeamlistFifa.order(fifa_lose: :desc)                     #피파트롤
        
         
        @rank_Heartstone_winner_point = TeamlistHearthstone.order(hearthstone_winner_point: :desc)     #하스승점
        @rank_Heartstone_total_game = TeamlistHearthstone.order(hearthstone_total_game: :desc)         #하스총경기수
        @rank_Heartstone_winning_rate = TeamlistHearthstone.order(hearthstone_winning_rate: :desc)     #하스승률
        @rank_Heartstone_lose = TeamlistHearthstone.order(hearthstone_lose: :desc)                     #하스트롤
        
         
        @rank_lol_winner_point = TeamlistLol.order(lol_winner_point: :desc)     #롤승점
        @rank_lol_total_game = TeamlistLol.order(lol_total_game: :desc)         #롤총경기수
        @rank_lol_winning_rate = TeamlistLol.order(lol_winning_rate: :desc)     #롤승률
        @rank_lol_lose = TeamlistLol.order(lol_lose: :desc)                     #롤트롤
        render layout: false
      
    end
    
    def matching_success
      @kind_of_game = params[:kind_of_game]
      
      if @kind_of_game == "lol"
        
        @lol_add_team_name_id = params[:lol_add_team_name_id]
       
        @my_lol_team = TeamlistLol.where(:lol_current_user_id => current_user.id).take
        @opposing_team = TeamlistLol.where(:lol_current_user_id => @lol_add_team_name_id).take
  
        @my_lol_team.lol_whichgame = true
        @my_lol_team.lol_opposing_team = @opposing_team.lol_team_name
        
        @my_lol_team.save
        
        @opposing_team.lol_whichgame = true
        @opposing_team.lol_opposing_team = @my_lol_team.lol_team_name
        @opposing_team.save
        
        
        @whichgame_lol = Whichgame.new
        @whichgame_lol.lol_whichgame_opposing_id = @opposing_team.id
        @whichgame_lol.lol_whichgame_opposing_teamname = @opposing_team.lol_team_name
        @whichgame_lol.lol_whichgame_my_id = @my_lol_team.id
        @whichgame_lol.lol_whichgame_my_teamname = @my_lol_team.lol_team_name
        @whichgame_lol.save
        
        
      elsif @kind_of_game == "fifa"
      
        @fifa_add_team_name_id = params[:fifa_add_team_name_id]
       
        @my_fifa_team = TeamlistFifa.where(:fifa_current_user_id => current_user.id).take
        @opposing_team = TeamlistFifa.where(:fifa_current_user_id => @fifa_add_team_name_id).take
  
        @my_fifa_team.fifa_whichgame = true
        @my_fifa_team.fifa_opposing_team = @opposing_team.fifa_user_name
        @my_fifa_team.save
        
        @opposing_team.fifa_whichgame = true
        @opposing_team.fifa_opposing_team = @my_fifa_team.fifa_user_name
        @opposing_team.save
        
        @whichgame_fifa = WhichgameFifa.new
        @whichgame_fifa.fifa_whichgame_opposing_id = @opposing_team.id
        @whichgame_fifa.fifa_whichgame_opposing_teamname = @opposing_team.fifa_user_name
        @whichgame_fifa.fifa_whichgame_my_id = @my_fifa_team.id
        @whichgame_fifa.fifa_whichgame_my_teamname = @my_fifa_team.fifa_user_name
        @whichgame_fifa.save
        
      else
        
        @hearthstone_add_team_name_id = params[:hearthstone_add_team_name_id]
       
        @my_hearthstone_team = TeamlistHearthstone.where(:hearthstone_current_user_id => current_user.id).take
        @opposing_team = TeamlistHearthstone.where(:hearthstone_current_user_id => @hearthstone_add_team_name_id).take
  
        @my_hearthstone_team.hearthstone_whichgame = true
        @my_hearthstone_team.hearthstone_opposing_team = @opposing_team.hearthstone_user_name
        @my_hearthstone_team.save
        
        @opposing_team.hearthstone_whichgame = true
        @opposing_team.hearthstone_opposing_team = @my_hearthstone_team.hearthstone_user_name
        @opposing_team.save
        
        @whichgame_hearthstone = WhichgameHearthstone.new
        @whichgame_hearthstone.hearthstone_whichgame_opposing_id = @opposing_team.id
        @whichgame_hearthstone.hearthstone_whichgame_opposing_teamname = @opposing_team.hearthstone_user_name
        @whichgame_hearthstone.hearthstone_whichgame_my_id = @my_hearthstone_team.id
        @whichgame_hearthstone.hearthstone_whichgame_my_teamname = @my_hearthstone_team.hearthstone_user_name
        @whichgame_hearthstone.save
        
      end
      
      redirect_to "/freematch/team_list"
    end
    
    def daejin
    end
    
    def whichgame
      @kind_of_game = params[:kind_of_game]
       
      @whichgame_lol = Whichgame.all
      @whichgame_fifa = WhichgameFifa.all
      @whichgame_hearthstone = WhichgameHearthstone.all
    end
    
    def whichgame_info
      
      @kind_of_game = params[:kind_of_game]
      @which_id = params[:which_id]
      
      if @kind_of_game == "lol"
        @whichgame_lol = Whichgame.find(@which_id)
        
        @lol_my_team_info = TeamlistLol.find(@whichgame_lol.lol_whichgame_my_id)
        @lol_opposing_team_info = TeamlistLol.find(@whichgame_lol.lol_whichgame_opposing_id)
      elsif @kind_of_game == "fifa"
        @whichgame_fifa = WhichgameFifa.find(@which_id)
        
        @fifa_my_info = TeamlistFifa.find(@whichgame_fifa.fifa_whichgame_my_id)
        @fifa_opposing_info = TeamlistFifa.find(@whichgame_fifa.fifa_whichgame_opposing_id)
      else
        @whichgame_hearthstone = WhichgameHearthstone.find(@which_id)
        
        @hearthstone_my_info = TeamlistHearthstone.find(@whichgame_hearthstone.hearthstone_whichgame_my_id)
        @hearthstone_opposing_info = TeamlistHearthstone.find(@whichgame_hearthstone.hearthstone_whichgame_opposing_id)
      end
      
    end
  
  # 승리한팀이 스크린샷 저장 시키는 곳 
   def image_upload
     
     @kind_of_game = params[:kind_of_game]
     
     if @kind_of_game == "lol"
      @whichgame_lol = Whichgame.find(params[:which_id])
      @whichgame_lol.lol_victory_image = params[:lol_img_file]
      @whichgame_lol.save
      redirect_to action: 'whichgame_info', :kind_of_game => 'lol', :which_id => params[:which_id]  
      
    elsif @kind_of_game == "fifa" 
      @whichgame_lol = WhichgameFifa.find(params[:which_id])
      @whichgame_lol.fifa_victory_image = params[:fifa_img_file]
      @whichgame_lol.save
      redirect_to action: 'whichgame_info', :kind_of_game => 'fifa', :which_id => params[:which_id]  
      
      
    else  
      @whichgame_lol = WhichgameHearthstone.find(params[:which_id])
      @whichgame_lol.hearthstone_victory_image = params[:hearthstone_img_file]
      @whichgame_lol.save
      redirect_to action: 'whichgame_info', :kind_of_game => 'hearthstone', :which_id => params[:which_id]  
      
     end
   end
  # 승리한팀이 스크린샷 저장 시키는 곳 끝
end
