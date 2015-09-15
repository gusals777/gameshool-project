class CreateTeamlists < ActiveRecord::Migration
  def change
    create_table :teamlists do |t|
      
      
      
      t.string :kind_of_game, null: false, default: ""          #팀등록 게임종류
      t.string :game_id     , null: false, default: ""          #팀등록 게임ID
      t.string :tear        , null: false, default: ""         #팀등록 계급
      t.text :comment       , null: false, default: ""         #팀등록 소개
      
      #------hearthstone DB 공간------
        
          t.string :hearthstone_major      , null: false, default: "" #hearthstone_major
          t.string :hearthstone_user_name  , null: false, default: ""  #하스스톤 유저 이름  
      #------hearthstone DB 공간------ 끝 
      
      
      
      #-----fifa DB 공간------
      
          t.string :fifa_major            , null: false, default: "" #fifa_major
          t.string :fifa_user_name        , null: false, default: "" #피파 유저 이름
      #-----fifa DB 공간------끝
      
      
      
      #------롤 DB 공간------
        
          t.string :lol_team_name, null: false, default: ""      #lol 팀명 
           
          t.string :lol_major              , null: false, default: ""     #lol_major
          t.integer :lol_current_user_id   , null: false, default: ""
        
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

      #------롤 DB 공간------끝
        
      t.timestamps null: false
    end
  end
end
