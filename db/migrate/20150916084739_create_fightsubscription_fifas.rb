class CreateFightsubscriptionFifas < ActiveRecord::Migration
  def change
    create_table :fightsubscription_fifas do |t|
        
        t.string  :fifa_user_name,                    null: false, default: ""
        t.integer :teamlist_fifa_id,                  null: false, default: ""
        t.integer :fifa_add_team_name_id,             null: false, default: ""
        
      t.timestamps null: false
    end
  end
end
