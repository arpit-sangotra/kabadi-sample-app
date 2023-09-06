class MatchesController < ApplicationController
  
  def show
    match = Match.find(params[:id])
    m = match.as_json
    m["raid"] = m["raid_time"].to_i > Time.now.to_i ? true : false
    render json: m
  end
end
