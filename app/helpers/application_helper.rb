module ApplicationHelper
  def my_island_selling?(current_user)
    my_island = Island.find_by(owner: current_user.id)

    return true unless my_island

    Sale.find_by(island_id: my_island.id)
  end
end
