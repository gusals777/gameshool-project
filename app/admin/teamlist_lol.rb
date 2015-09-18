ActiveAdmin.register TeamlistLol do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:lol_total_game, :lol_total_game, :lol_victory, :lol_lose, :lol_winner_point, :lol_winning_rate]
#   permitted << :other if resource.something?
  permitted
end

  index do
  column :id
  column :leader_name
  column :lol_team_name
  column :lol_total_game
  column :lol_victory
  column :lol_lose
  column :lol_winner_point
  column :lol_winning_rate
  
  actions
  end

end
