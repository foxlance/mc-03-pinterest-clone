class Pin < ActiveRecord::Base

	belongs_to :user
	
	validates :title, :description, presence: :true, length: {minimum: 5}
end
