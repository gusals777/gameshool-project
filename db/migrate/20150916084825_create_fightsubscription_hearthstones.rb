class CreateFightsubscriptionHearthstones < ActiveRecord::Migration
  def change
    create_table :fightsubscription_hearthstones do |t|
        
        t.string  :hearthstone_user_name,                   null: false, default: ""
        t.integer :teamlist_hearthstone_id,                 null: false, default: ""
        t.integer :hearthstone_add_team_name_id,            null: false, default: ""
        
      t.timestamps null: false
    end
  end
end
