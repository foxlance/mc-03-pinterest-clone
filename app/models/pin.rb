class Pin < ActiveRecord::Base
	validates :title, :description, presence: :true, length: {minimum: 5}
end
