class Api::V1::FeelingsController < ApplicationController
  def index
    feelings = Feeling.all
    render json: feelings
  end
end
