class FormsController < ApplicationController

  SLACK_URL = 'https://slack.com/api/files.upload'

  before_action :redirect_to_root,
    :only => [:new],
    :unless => :logged_in?


  def new
    @username = session[:username]
    @form_type = params[:form_type] || :daily_buzz
  end

  def create
    form_handler = ::Forms::FormFactory.new.build params[:form_type]
    response = self.post_to_slack form_handler.generate_query_string(params)

    if response['ok']
      self.save_form_to_db response['file']

      redirect_to :new_form,
        :flash => {:success => 'Successfully posted to slack!'}
    else
      redirect_to :new_form, :flash => {:alert => 'Error!'}
    end
  end



  protected

  def post_to_slack query_string
    query_string.merge! :token => session[:access_token]

    JSON.parse RestClient.post(SLACK_URL, query_string)
  end

  def save_form_to_db file_info
    Form.create :data => file_info, :form_type => :daily_buzz
  end

  def redirect_to_root
    redirect_to :root
  end

end
