class FreematchController < ApplicationController
    
    def index
        
    end
    
    def add_team
      
        @Duplication_subscription_lol = TeamlistLol.where(:lol_current_user_id => current_user.id).take
        @Duplication_subscription_fifa = TeamlistFifa.where(:fifa_current_user_id => current_user.id).take
        @Duplication_subscription_hearthstone = TeamlistHearthstone.where(:hearthstone_current_user_id => current_user.id).take
        
        
    end
    
    def delete_team
      
        team_destroy = TeamlistLol.find(params[:id])
        
        if team_destroy.leader_name == current_user.name
          
          team_destroy.destroy
          redirect_to '/freematch/team_list'
        else
          redirect_to :back
        end
             
    end
    
    def team_list
        
        @teamlists_fifa = TeamlistFifa.all
        @teamlists_lol = TeamlistLol.all
        @teamlists_hearthstone = TeamlistHearthstone.all
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
          
        # 롤 학과
          @teamlists.lol_major = params[:lol_major]
        
        
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
      
        @id = params[:id]
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
        
        @aaa = TeamlistLol.where(:lol_current_user_id => current_user.id).take
        
        # @subscription_name = Fightsubscription.all
       
        
    end
    


   # 대결신청 시 신청팀 저장 시킴
    def subscription_write
      
      if params[:kind_of_game] == "lol"  
        @lol_subscription_user = TeamlistLol.where(:lol_current_user_id => params[:current_user_id]).take
      
        @subscription = Fightsubscription.new
        @subscription.lol_subscription_team_name = @lol_subscription_user.lol_team_name
        @subscription.teamlist_lol_id = params[:teamlist_id]
        @subscription.lol_add_team_name_id = @lol_subscription_user.id
        @subscription.save
        
      elsif params[:kind_of_game] == "fifa"
        @fifa_subscription_user = TeamlistFifa.where(:fifa_current_user_id => params[:current_user_id]).take
      
        @subscription = FightsubscriptionFifa.new
        @subscription.fifa_user_name = @fifa_subscription_user.fifa_user_name
        @subscription.teamlist_fifa_id = params[:teamlist_id]
        @subscription.fifa_add_team_name_id = @fifa_subscription_user.id
        @subscription.save
        
      else
        @hearthstone_subscription_user = TeamlistHearthstone.where(:hearthstone_current_user_id => params[:current_user_id]).take
      
        @subscription = FightsubscriptionHearthstone.new
        @subscription.hearthstone_user_name = @hearthstone_subscription_user.hearthstone_user_name
        @subscription.teamlist_hearthstone_id = params[:teamlist_id]
        @subscription.hearthstone_add_team_name_id = @hearthstone_subscription_user.id
        @subscription.save
      end
        
       render :text =>""
        
    end
   # 대결신청 시 신청팀 저장 시킴 끝 
    
    def rank
      render layout: false
    end
    
    def loldetailrank
    end
    

   def matching_success
     
     
    
    
      @lol_my_team = Fightsubscription.where(:lol_add_team_name_id => current_user.id).take
      @lol_opposingteam = Fightsubscription.find(params[:id])
      
      
      
   end
   
   
    
 
end
