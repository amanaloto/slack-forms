class FormsController < ApplicationController

  CHANNEL_IDS = {:test => 'C08DNL6J0', :daily_buzz => 'C08H3DSN5'}
  SLACK_URL = 'https://slack.com/api/files.upload'

  before_action :redirect_to_root,
    :only => [:new],
    :unless => :logged_in?


  def new
    @username = session[:username]
  end

  def create
    response = self.post_to_slack

    if response['ok']
      self.save_form_to_db response['file']

      redirect_to :new_form,
        :flash => {:success => 'Successfully posted to slack!'}
    else
      redirect_to :new_form, :flash => {:alert => 'Error!'}
    end
  end



  protected

  def post_to_slack
    date_today = Time.now.strftime '%Y-%m-%d'
    query_string = {
      :token => session[:access_token],
      :content => params[:body],
      :filetype => 'post',
      :filename => date_today + '.txt',
      :title => date_today,
      :initial_comment => params[:comment],
      :channels => CHANNEL_IDS[params[:channel].to_sym]
    }

    JSON.parse RestClient.post(SLACK_URL, query_string)
  end

  def save_form_to_db file_info
    Form.create :data => file_info, :form_type => :daily_buzz
  end

  def redirect_to_root
    redirect_to :root
  end

end
