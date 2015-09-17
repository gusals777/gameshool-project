class CreateTeamlistLols < ActiveRecord::Migration
  def change
    create_table :teamlist_lols do |t|
      
          
          #------롤 DB 공간------
          
        
          t.boolean :lol_whichgame,         null: false, default: false
        
          t.string :lol_team_name          , null: false, default: ""      #lol 팀명 
           
          t.string :lol_major              , null: false, default: ""     #lol_major
          t.integer :lol_current_user_id   , null: false, default: ""
          
          t.text :comment,                null: false, default: ""         #팀등록 소개
        
        #Game ID
          t.string :lol_leader_id         , null: false, default: ""
          t.string :lol_user_id_1         , null: false, default: ""
          t.string :lol_user_id_2         , null: false, default: ""
          t.string :lol_user_id_3         , null: false, default: ""
          t.string :lol_user_id_4         , null: false, default: ""
          
        #Game tear
          t.string :lol_leader_tear       , null: false, default: ""
          t.string :lol_tear_user_1       , null: false, default: ""
          t.string :lol_tear_user_2       , null: false, default: ""
          t.string :lol_tear_user_3       , null: false, default: ""
          t.string :lol_tear_user_4       , null: false, default: ""
          
        #LoL user name
          t.string :leader_name           , null: false, default: ""
          t.string :lol_member_name_1     , null: false, default: ""
          t.string :lol_member_name_2     , null: false, default: ""
          t.string :lol_member_name_3     , null: false, default: ""
          t.string :lol_member_name_4     , null: false, default: ""
          
        #롤 랭크
          t.integer :lol_total_game       , null: false, default: 0   #롤 총 경기수
          t.integer :lol_victory          , null: false, default: 0   #롤 승수
          t.integer :lol_lose             , null: false, default: 0   #롤 패수  
          t.integer :lol_winner_point     , null: false, default: 0   #롤 승점  
          t.integer :lol_winning_rate     , null: false, default: 0   #롤 승률

      #------롤 DB 공간------끝
        

      t.timestamps null: false
    end
  end
end
