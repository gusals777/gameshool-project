class CreateWhichgameFifas < ActiveRecord::Migration
  def change
    create_table :whichgame_fifas do |t|

        # 피파 매칭성사  
          t.integer :fifa_whichgame_my_id,                     default: 0
          t.integer :fifa_whichgame_opposing_id,               default: 0
          t.string :fifa_whichgame_my_teamname,                default: ""
          t.string :fifa_whichgame_opposing_teamname,          default: ""

      t.timestamps null: false
    end
  end
end
