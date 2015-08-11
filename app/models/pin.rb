class Pin < ActiveRecord::Base

	belongs_to :user
	
	validates :title, :description, presence: :true, length: {minimum: 5}

	has_attached_file :image, styles: { medium: "300x300>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
