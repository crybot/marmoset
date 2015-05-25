class Document < ActiveRecord::Base
  belongs_to :classroom
  before_save { self.author_email = author_email.downcase }
  validates :name, presence: true, length: {maximum: 20}
  validates :author_email, presence: true
end
