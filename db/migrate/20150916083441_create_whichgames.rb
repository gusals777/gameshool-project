class CreateWhichgames < ActiveRecord::Migration
  def change
    create_table :whichgames do |t|
      
          t.boolean :lol_whichgame, null: false, default: false
          
          t.integer :lol_whichgame_id,                 null: false, default: ""
          
          t.integer :lol_add_team_name_id,            null: false, default: ""
          
      t.timestamps null: false
    end
  end
end
