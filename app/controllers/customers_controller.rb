class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  add_breadcrumb "Dashborad", :root_path
  add_breadcrumb "Customer", :customers_path
  def index
    @customers = Customer.all.paginate(:per_page => 10 , :page => params[:page])
    @orders = Order.all
    add_breadcrumb "Index", customers_path

  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    add_breadcrumb "Show", customers_path

  end

  # GET /customers/new
  def new
    @customer = Customer.new
    add_breadcrumb "New", customers_path

  end

  # GET /customers/1/edit
  def edit
     add_breadcrumb "Edit", customers_path

  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :address, :birthday, :customer_number)
    end
end
