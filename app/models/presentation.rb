class Presentation < ActiveRecord::Base

  belongs_to :user

  has_many :evaluations

  validates :title, :uniqueness => true
  validates :user, :presence => true


  def self.valid_presentations
    Hash[Presentation.all.map{ |p| ["#{p.title} by #{p.user.name}", p.id] }]
  end

end
