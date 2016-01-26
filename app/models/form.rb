class Form < ActiveRecord::Base

  FORM_TYPES = [:daily_buzz, :'payroll-hero']
  CHANNEL_IDS = {
    :daily_buzz => 'C08H3DSN5',
    :'payroll-hero' => 'C0FB2JFM4',
    :test => 'C08DNL6J0'
  }

  serialize :data, JSON

  belongs_to :user

  enum :form_type => FORM_TYPES

  scope :payroll_hero, -> { send :'payroll-hero' }

end
