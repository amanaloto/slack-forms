class FormsController < ApplicationController

  CHANNEL_IDS = {:test => 'C08DNL6J0'}
  SLACK_URL = 'https://slack.com/api/files.upload'

  def new

  end

  def create
    query_string = {
      :token => 'xoxp-6975943360-6976657185-15437650999-58168557e1',
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
