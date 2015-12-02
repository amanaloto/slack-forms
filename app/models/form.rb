class Form < ActiveRecord::Base

  serialize :data, JSON

  enum :form_type => [:daily_buzz]

end
