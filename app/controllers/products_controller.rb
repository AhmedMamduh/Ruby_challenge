class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = paginate(Product.all) unless params[:promo_code].present? || params[:search].present?
    return if params[:search].present? && get_products_by_department_name.nil?
    @products = paginate(get_products_by_department_name) if params[:search].present? && params[:promo_code].nil?
    @products = paginate(filterd_products_by_promotions(get_products_by_department_name)) if params[:promo_code].present? && params[:search].present?
    @products = paginate(filterd_products_by_promotions(Product.all)) if params[:promo_code].present? && params[:search] == ""
    if @products.present?
      @products = @products.search_by_name(params[:product_name]) if params[:product_name].present?
      render status: :ok
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_products_by_department_name
      Department.get_products(params[:search]) if params[:search].present?
    end

    def filterd_products_by_promotions(products)
      products.joins(:promotions).where("promotions.active = ?", params[:promo_code] == "true")
    end

    def paginate(products)
      products.paginate(:per_page => 5, :page => params[:page])
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :department_id)
    end
end
