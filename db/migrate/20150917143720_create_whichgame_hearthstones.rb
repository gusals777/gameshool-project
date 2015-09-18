class CreateWhichgameHearthstones < ActiveRecord::Migration
  def change
    create_table :whichgame_hearthstones do |t|
      
      # 핫스 매칭성사  
          t.integer :hearthstone_whichgame_my_id,                      default: 0
          t.integer :hearthstone_whichgame_opposing_id,                default: 0
          t.string :hearthstone_whichgame_my_teamname,                 default: ""
          t.string :hearthstone_whichgame_opposing_teamname,           default: ""
          t.string :hearthstone_victory_image
      t.timestamps null: false
    end
  end
end
