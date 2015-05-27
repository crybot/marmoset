class Document < ActiveRecord::Base
  belongs_to :classroom
  validates :name, presence: true, length: {maximum: 20}, 
    uniqueness: {case_sensitive: true, scope: :classroom_id}
end
