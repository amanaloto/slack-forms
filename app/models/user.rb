class User < ActiveRecord::Base

  has_many :presentations
  has_many :evaluations

end
