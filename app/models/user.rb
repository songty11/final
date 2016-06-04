class User < ActiveRecord::Base
	has_many :tweets
	has_secure_password
	mount_uploader :image, ImageUploader
	validates_processing_of :image
	validate :image_size_validation
	 
	private
	  def image_size_validation
	    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
	  end

	GENDER_TYPES = ["Not telling","Male", "Female"]
end
