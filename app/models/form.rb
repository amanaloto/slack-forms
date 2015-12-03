class Form < ActiveRecord::Base

  FORM_TYPES = [:daily_buzz]
  CHANNEL_IDS = {:daily_buzz => 'C08H3DSN5', :test => 'C08DNL6J0'}

  serialize :data, JSON

  enum :form_type => FORM_TYPES

end
