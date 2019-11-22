class ProductsPromotionsController < ApplicationController
  before_action :set_products_promotion, only: [:show, :edit, :update, :destroy]

  # GET /products_promotions
  # GET /products_promotions.json
  def index
    @products_promotions = ProductsPromotion.all
  end

  # GET /products_promotions/1
  # GET /products_promotions/1.json
  def show
  end

  # GET /products_promotions/new
  def new
    @products_promotion = ProductsPromotion.new
  end

  # GET /products_promotions/1/edit
  def edit
  end

  # POST /products_promotions
  # POST /products_promotions.json
  def create
    @products_promotion = ProductsPromotion.new(products_promotion_params)

    respond_to do |format|
      if @products_promotion.save
        format.html { redirect_to @products_promotion, notice: 'Products promotion was successfully created.' }
        format.json { render :show, status: :created, location: @products_promotion }
      else
        format.html { render :new }
        format.json { render json: @products_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_promotions/1
  # PATCH/PUT /products_promotions/1.json
  def update
    respond_to do |format|
      if @products_promotion.update(products_promotion_params)
        format.html { redirect_to @products_promotion, notice: 'Products promotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_promotion }
      else
        format.html { render :edit }
        format.json { render json: @products_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_promotions/1
  # DELETE /products_promotions/1.json
  def destroy
    @products_promotion.destroy
    respond_to do |format|
      format.html { redirect_to products_promotions_url, notice: 'Products promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_promotion
      @products_promotion = ProductsPromotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_promotion_params
      params.require(:products_promotion).permit(:promotion_id, :product_id)
    end
end
