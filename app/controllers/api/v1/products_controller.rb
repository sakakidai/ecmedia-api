# frozen_string_literal: true

class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    products = Product.all
    render json: products, each_serializer: ProductSerializer
  end
end
