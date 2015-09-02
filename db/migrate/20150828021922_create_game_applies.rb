class CreateGameApplies < ActiveRecord::Migration
  def change
    create_table :game_applies do |t|
     

      t.string  :name,        null: false, default: ""
      t.string  :major,       null: false, default: ""
      t.string  :hakbun,      null: false, default: ""
      t.string  :kakao,       null: false, default: ""
      t.string  :phone_num,   null: false, default: ""
      t.string  :email,       null: false, default: ""
      t.string  :game,        null: false, default: ""
      t.string  :team_name,   null: false, default: ""
      

      t.timestamps null: false
    end
  end
end
