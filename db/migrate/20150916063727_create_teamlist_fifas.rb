class CreateTeamlistFifas < ActiveRecord::Migration
  def change
    create_table :teamlist_fifas do |t|
      
      t.string :game_id,                null: false, default: ""          #팀등록 게임ID
      t.string :tear,                   null: false, default: ""         #팀등록 계급
      t.text :comment,                  null: false, default: ""         #팀등록 소개
      t.integer :fifa_current_user_id,  null: false, default: ""
      
      t.string :fifa_major,             null: false, default: "" #fifa_major
      t.string :fifa_user_name,         null: false, default: "" #피파 유저 이름
      
      #피파 랭크
        t.integer :fifa_total_game       , null: false, default: 0   #피파 총 경기수
        t.integer :fifa_victory          , null: false, default: 0   #피파 승수
        t.integer :fifa_lose             , null: false, default: 0   #피파 패수  
        t.integer :fifa_winner_point     , null: false, default: 0   #피파 승점  
        t.integer :fifa_winning_rate     , null: false, default: 0   #피파 승률

      t.timestamps null: false
    end
  end
end
