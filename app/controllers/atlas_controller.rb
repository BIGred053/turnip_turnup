# frozen_string_literal: true

class AtlasController < ApplicationController
  def home
    @sales = Sale.includes(:sales_users, :island)
  end
end
