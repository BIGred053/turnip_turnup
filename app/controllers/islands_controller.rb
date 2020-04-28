# frozen_string_literal: true

class IslandsController < ApplicationController
  before_action :set_island, only: %i[show edit update destroy]
  before_action :verify_owner, only: %i[show edit update destroy]

  # GET /islands
  # GET /islands.json
  # def index
  #   @islands = Island.all
  # end

  # GET /islands/1
  # GET /islands/1.json
  def show; end

  # GET /islands/new
  def new
    @island = Island.new(user_id: current_user.id)
  end

  # GET /islands/1/edit
  def edit; end

  # POST /islands
  # POST /islands.json
  def create
    @island = Island.new(island_params)

    if @island.save
      redirect_to @island, notice: 'Island was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /islands/1
  # PATCH/PUT /islands/1.json
  def update
    if @island.update(island_params)
      redirect_to @island, notice: 'Island was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /islands/1
  # DELETE /islands/1.json
  def destroy
    @island.destroy

    redirect_to '/', notice: 'Island was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_island
    @island = Island.find(params[:id])
  end

  def verify_owner
    return if @island.user_id == current_user.id

    flash[:alert] = "Only an island's owner can access and manage it."
    redirect_to '/'
  end

  # Only allow a list of trusted parameters through.
  def island_params
    params.require(:island).permit(:name, :user_id, :native_fruit)
  end
end
