class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  add_breadcrumb "Dashborad", :root_path
  add_breadcrumb "Order", :orders_path
  def index
    @orders = Order.all.paginate(:per_page => 10 , :page => params[:page])
    @customers= Customer.all
    add_breadcrumb "Index", orders_path

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    add_breadcrumb "Show", orders_path

  end

  # GET /orders/new
  def new
    @order = Order.new
    add_breadcrumb "New", orders_path

  end

  # GET /orders/1/edit
  def edit
    add_breadcrumb "Edit", orders_path

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
     end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :order_number, :order_date, :sum, :customer_id)
    end
end
