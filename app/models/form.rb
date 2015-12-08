class Form < ActiveRecord::Base

  FORM_TYPES = [:daily_buzz, :evaluation, :payroll_hero]
  CHANNEL_IDS = {
    :daily_buzz => 'C08H3DSN5',
    :payroll_hero => 'C0FB2JFM4',
    :test => 'C08DNL6J0'
  }
  LOADS = ['#0', '#1', '#2']

  serialize :data, JSON

  enum :form_type => FORM_TYPES

end
