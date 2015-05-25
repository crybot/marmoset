class Document < ActiveRecord::Base
  belongs_to :classroom
  validates :name, presence: true, length: {maximum: 20}
end
