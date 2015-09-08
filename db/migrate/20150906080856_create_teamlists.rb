class CreateTeamlists < ActiveRecord::Migration
  def change
    create_table :teamlists do |t|
      
      
      t.string :kind_of_game
      t.string :team_name
      t.string :member_name
      t.string :game_id
      t.string :tear
      t.text :comment
      t.integer :team_id
      

      t.timestamps null: false
    end
  end
end
