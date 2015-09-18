class CreateWhichgames < ActiveRecord::Migration
  def change
    create_table :whichgames do |t|
      
        #롤 매칭성사  
          t.integer :lol_whichgame_my_id,                     default: 0
          t.integer :lol_whichgame_opposing_id,               default: 0
          t.string :lol_whichgame_my_teamname,                default: ""
          t.string :lol_whichgame_opposing_teamname,          default: ""
          t.string :lol_victory_image
          
      t.timestamps null: false
    end
  end
end
