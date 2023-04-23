class Api::V1::CellsController < ApplicationController

  def index
    render json: { message: 'OK' }
  end

end
