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
		@pin = current_user.pins.new(pin_params)	

		if @pin.save
			redirect_to pin_path(@pin), notice: 'Successfully created a new Pin!'
		else
			render 'new'
		end	
	end

	def edit
		
	end

	def update
		@pin = current_user.pins.find(params[:id])

		if @pin.update(pin_params)
			redirect_to pin_path, notice: 'Pin was successfully updated!'
		else
			render 'edit'
		end
	end


	private

	def find_pin
		@pin = Pin.find(params[:id])
	end

	def pin_params
		params.require(:pin).permit(:title, :description, :image)
	end

end
