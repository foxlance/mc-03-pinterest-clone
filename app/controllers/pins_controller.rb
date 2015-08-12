class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@pins = Pin.all.order('created_at DESC')
	end

	def show
		
	end

	def new
		@pin = current_user.pins.new
	end

	def create
		
	end


	private

	def find_pin
		@pin = Pin.find(params[:id])
	end

	def pin_params
		params.require(:pin).permit(:title, :description, :image)
	end

end
