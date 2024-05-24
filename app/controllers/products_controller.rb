class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :destroy]

  def create
    product = Product.new(product_params)
    if product.save
      render json: { status: { code: 201, message: 'Product created successfully.' }, data: product }, status: :created
    else
      render json: { status: { code: 422, message: "Product couldn't be created.", errors: product.errors.full_messages }, status: :unprocessable_entity }
    end
  end

  def index
    products = Product.all
    render json: { status: { code: 200, message: 'Products fetched successfully.' }, data: products }, status: :ok
  end

  def update
    if @product.update(product_params)
      render json: { status: { code: 200, message: 'Product updated successfully.' }, data: @product }, status: :ok
    else
      render json: { status: { code: 422, message: "Product couldn't be updated.", errors: @product.errors.full_messages }, status: :unprocessable_entity }
    end
  end

  def destroy
    @product.destroy
    render json: { status: { code: 200, message: 'Product deleted successfully.' } }, status: :ok
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { status: { code: 404, message: 'Product not found.' } }, status: :not_found
  end

  def product_params
    params.require(:product).permit(:name, :brand, :url, :size, :quantity)
  end
end
