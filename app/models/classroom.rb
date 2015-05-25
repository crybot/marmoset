class Classroom < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :documents
  validates :name, presence: true, length: {maximum: 20}, uniqueness: {case_sensitive: true}

end

