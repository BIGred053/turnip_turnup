class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_user_island_path

  private

  def set_user_island_path
    return unless user_signed_in?

    user_island = Island.find_by(user: current_user)
    @user_island_path = user_island.nil? ? new_island_path : edit_island_path(user_island)
  end
end
