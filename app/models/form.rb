class Form < ActiveRecord::Base

  serialize :data, JSON

end
