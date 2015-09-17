class CreateWhichgames < ActiveRecord::Migration
  def change
    create_table :whichgames do |t|
      
          
          t.integer :lol_whichgame_my_id,                null: false, default: ""
          t.integer :lol_whichgame_opposing_id,          null: false, default: ""
          
          
          t.string :lol_whichgame_my_teamname,                null: false, default: ""
          t.string :lol_whichgame_opposing_teamname,          null: false, default: ""

          
      t.timestamps null: false
    end
  end
end
