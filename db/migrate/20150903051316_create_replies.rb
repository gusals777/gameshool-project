class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
        
        t.integer :freeboard_id
        t.string :rp_name
        t.string :rp_content
        t.string :rp_hakbun

      t.timestamps null: false
    end
  end
end
