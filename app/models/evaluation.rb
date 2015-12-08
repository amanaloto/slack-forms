class Evaluation < ActiveRecord::Base

  POINT_SYSTEM = Array(1..5)

  belongs_to :presentation
  belongs_to :user

  validates :presentation, :presence => true

end
