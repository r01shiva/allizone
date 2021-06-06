# frozen_string_literal:true

class Api::Product::ProductController < Api::ApplicationController
  def products
    response = Product.all
    @response[:data] = response
    @response[:status] = 200
    send_response
  end

  def product
    response = Product.find_by(id: params[:id])
    @response[:data] = response
    @response[:status] = 200
    send_response
  end
end
