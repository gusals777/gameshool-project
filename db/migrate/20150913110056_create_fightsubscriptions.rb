class CreateFightsubscriptions < ActiveRecord::Migration
  def change
    create_table :fightsubscriptions do |t|
      
          t.text :lol_subscription_team_name,         null: false, default: ""   #롤 대전 신청한 팀들의 팀명
          
          t.integer :teamlist_lol_id,                 null: false, default: ""
          
          t.integer :lol_add_team_name_id,            null: false, default: ""  #롤 팀등록 시 등록된 id를 담음
          
      t.timestamps null: false
    end
  end
end
