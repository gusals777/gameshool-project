class CreateTeamlistFifas < ActiveRecord::Migration
  def change
    create_table :teamlist_fifas do |t|
      
      t.string :game_id,                null: false, default: ""          #팀등록 게임ID
      t.string :tear,                   null: false, default: ""         #팀등록 계급
      t.text :comment,                  null: false, default: ""         #팀등록 소개
      t.integer :fifa_current_user_id,  null: false, default: ""
      
      t.string :fifa_major,             null: false, default: "" #fifa_major
      t.string :fifa_user_name,         null: false, default: "" #피파 유저 이름

      t.timestamps null: false
    end
  end
end
