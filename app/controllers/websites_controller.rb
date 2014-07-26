class WebsitesController < ApplicationController

  def show
    get_website
    # TODO: DRY
    @town = @website.town.capitalize
    @name = @website.team.capitalize
    @teams = current_user.program.teams unless current_user.nil?
    @players = Player.all
    @user = current_user || User.new
  end

  def all_players
    all_player = []
    teams = current_user.program
    ids = teams.map {|team| team.players.map(&:id)}.flatten
  end

end
