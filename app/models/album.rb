class Album < ActiveRecord::Base

  belongs_to :singer  #, foreign_key: :Singer_id, class_name: "Singer"

  has_many :songs
  has_many :composers

end
