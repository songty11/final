class Album < ActiveRecord::Base

  belongs_to :artist  #, foreign_key: :Singer_id, class_name: "Singer"

  has_many :songs

end
