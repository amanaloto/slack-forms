class Presentation < ActiveRecord::Base

  belongs_to :user

  has_many :evaluations

  validates :title, :uniqueness => true

end
