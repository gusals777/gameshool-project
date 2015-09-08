class CreateTeamlists < ActiveRecord::Migration
  def change
    create_table :teamlists do |t|
      
      
      
      t.string :kind_of_game          #팀등록 게임종류
      t.string :game_id               #팀등록 게임ID
      t.string :tear                  #팀등록 계급
      t.text :comment                 #팀등록 소개
      
      #------hearthstone DB 공간------
        
          t.string :hearthstone_major       #hearthstone_major
          t.string :hearthstone_user_name   #하스스톤 유저 이름  
      #------hearthstone DB 공간------ 끝 
      
      
      
      #-----fifa DB 공간------
      
          t.string :fifa_major             #fifa_major
          t.string :fifa_user_name         #피파 유저 이름
      #-----fifa DB 공간------끝
      
      
      
      #------롤 DB 공간------
        
          t.string :lol_team_name         #lol 팀명 
          t.string :lol_major             #lol_major
        
        #Game ID
          t.string :lol_leader_id
          t.string :lol_user_id_1
          t.string :lol_user_id_2
          t.string :lol_user_id_3
          t.string :lol_user_id_4
          
        #Game tear
          t.string :lol_leader_tear
          t.string :lol_tear_user_1
          t.string :lol_tear_user_2
          t.string :lol_tear_user_3
          t.string :lol_tear_user_4
          
        #LoL user name
          t.string :leader_name
          t.string :lol_member_name_1
          t.string :lol_member_name_2
          t.string :lol_member_name_3
          t.string :lol_member_name_4

      #------롤 DB 공간------끝
        
      t.timestamps null: false
    end
  end
end
