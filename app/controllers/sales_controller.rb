# frozen_string_literal: true

class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update destroy]
  before_action :verify_sale_owner, only: %i[edit update destroy]
  before_action :set_user_island, only: %i[new edit]

  # GET /sales/1
  # GET /sales/1.json
  def show
    redirect_to '/', notice: 'Sorry, the owner seems to have closed the sale!' if @sale.nil?

    all_in_queue = SalesUser.where(sale: @sale).order(:created_at)
    user_in_queue = SalesUser.find_by(sale: @sale, user: current_user)

    @pos_in_queue = all_in_queue.index(user_in_queue)

    @pos_in_queue += 1 if @pos_in_queue
  end

  # GET /sales/new
  def new
    @sale = Sale.new(user_id: current_user.id)
  end

  # GET /sales/1/edit
  def edit; end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to @sale, notice: 'Sale was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    if @sale.update(sale_params)
      redirect_to @sale, notice: 'Sale was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy

    redirect_to sales_url, notice: 'Sale was successfully destroyed.'
  end

  def join
    @sale = Sale.find(params[:sale_id])
    SalesUser.find_or_create_by(sale: @sale, user: current_user)

    set_active_visitor

    redirect_to @sale, notice: 'You have joined the queue!'
  end

  def next
    @sale = Sale.find(params[:sale_id])
    SalesUser.find_by(sale: @sale, user: current_user).destroy

    set_active_visitor

    redirect_to '/'
  end

  private

  def set_active_visitor
    first_in_line = SalesUser.where(sale: @sale).order(:created_at).first
    Sale.update(active_visitor_id: first_in_line&.user&.id)
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def set_user_island
    @user_island = Island.find_by(owner: current_user.id)

    redirect_to '/' unless @user_island
  end

  # Only allow a list of trusted parameters through.
  def sale_params
    params.require(:sale).permit(:island_id, :user_id, :sale_price, :dodo_code)
  end

  def verify_sale_owner
    return if @sale.owner == current_user.id

    flash[:alert] = 'Only the creator of a sale can manage it.'
    redirect_to '/'
  end
end
