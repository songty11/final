class Track < ActiveRecord::Base

  belongs_to :album
  belongs_to :song
  has_many :tracks

end
