class FormsController < ApplicationController

  CHANNEL_IDS = {:test => 'C08DNL6J0'}
  SLACK_URL = 'https://slack.com/api/files.upload'


  def new
    # redirect_to :root if session[:access_token].nil?
  end

  def create
    response = self.post_to_slack

    if response['ok']
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
      :channels => CHANNEL_IDS[:test]
    }

    JSON.parse RestClient.post(SLACK_URL, query_string)
  end

end
