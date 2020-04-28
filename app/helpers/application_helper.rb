module ApplicationHelper
  def my_island_selling?(current_user)
    my_island = Island.find_by(user: current_user)

    return true unless my_island

    Sale.find_by(island: my_island)
  end
end
