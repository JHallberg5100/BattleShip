class ShipsController < ApplicationController
  include ShipsHelper

  def index
  end

  def create
    position = find_position(params[:position], params[:size], params[:direction])

  end
end
