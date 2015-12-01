class FormsController < ApplicationController

  CHANNEL_IDS = {:test => 'C08DNL6J0'}
  SLACK_URL = 'https://slack.com/api/files.upload'

  def new
    # redirect_to :root if session[:access_token].nil?
  end

  def create
    query_string = {
      :token => session[:access_token],
      :file => 'daily_buzz',
      :content => params[:body],
      :filetype => 'post',
      :filename => Time.now.strftime('%Y-%m-%d') + '.txt',
      :title => Time.now.strftime('%Y-%m-%d'),
      :initial_comment => '#test',
      :channels => CHANNEL_IDS[:test]
    }

    puts RestClient.post(SLACK_URL, query_string)

    redirect_to :new_form
  end

end
