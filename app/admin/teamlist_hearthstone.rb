ActiveAdmin.register TeamlistHearthstone do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:hearthstone_total_game, :hearthstone_total_game, :hearthstone_victory, :hearthstone_lose, :hearthstone_winner_point, :hearthstone_winning_rate]
#   permitted << :other if resource.something?
  permitted
end

  index do
  column :id
  column :hearthstone_user_name
  column :game_id
  column :hearthstone_total_game
  column :hearthstone_victory
  column :hearthstone_lose
  column :hearthstone_winner_point
  column :hearthstone_winning_rate
  
  actions
  end
end
