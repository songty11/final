class Actor < ActiveRecord::Base

  has_many :albums
  has_many :songs

end
