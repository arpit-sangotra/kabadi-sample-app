ActiveAdmin.register Match do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :team1_name, :team2_name, :team1_score, :team2_score, :winner, :tournament_name, :start_time, :end_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:team1_name, :team2_name, :team1_score, :team2_score, :winner, :tournament_name, :start_time, :end_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  member_action :update_team_1_score, method: :post do
    match = Match.find(params[:id])
    match.update(team1_score: match.team1_score.to_i + 1)
    redirect_to admin_match_path(match)
  end

  member_action :update_team_2_score, method: :post do
    match = Match.find(params[:id])
    match.update(team2_score: match.team2_score.to_i + 1)
    redirect_to admin_match_path(match)
  end

  member_action :start_raid, method: :post do
    match = Match.find(params[:id])
    match.update(raid_time: Time.now + 30.seconds)
    redirect_to admin_match_path(match)
  end

  action_item :update_team_1_score, only: :show do
    link_to "Update Team 1 Score", update_team_1_score_admin_match_path, method: :post
  end

  action_item :update_team_2_score, only: :show do
    link_to "Update Team 2 Score", update_team_2_score_admin_match_path, method: :post
  end

  action_item :start_raid, only: :show do
    link_to "Start Raid", start_raid_admin_match_path, method: :post
  end
end
