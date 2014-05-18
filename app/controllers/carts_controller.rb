class CartsController < ApplicationController

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.valid?
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  private
     # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:credit_number, :credit_pin, :credit_date)
    end
end
