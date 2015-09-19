ActiveAdmin.register TeamlistFifa do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:fifa_total_game, :fifa_total_game, :fifa_victory, :fifa_lose, :fifa_winner_point, :fifa_winning_rate, :created_at]
#   permitted << :other if resource.something?
  permitted
end

  index do
  column :id
  column :fifa_user_name
  column :game_id
  column :fifa_total_game
  column :fifa_victory
  column :fifa_lose
  column :fifa_winner_point
  column :fifa_winning_rate
  column :created_at
  
  actions
  end
end
