class Artist < ActiveRecord::Base

  has_many :albums,:dependent => :nullify
  has_many :songs
  has_many :toptracks

end
