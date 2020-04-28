module ApplicationHelper
  def my_island_selling?(current_user)
    my_island = Island.find_by(user_id: current_user.id)

    return true unless my_island

    Sale.find_by(island: my_island)
  end
end
