class SessionsController < ApplicationController

  SLACK_AUTH_URL = 'https://slack.com/oauth/authorize'
  SLACK_ACCESS_URL = 'https://slack.com/api/oauth.access'
  REDIRECT_URI = 'http://localhost:3000/oauth'


  def new
    @auth_link = self.generate_auth_link
  end

  def oauth
    response = self.get_access_token

    if response['ok']
      session[:access_token] = response['access_token']
      redirect_to :new_form,
        :flash => {:success => 'Successful authentication!'}
    else
      redirect_to :root,
        :flash => {:alert => 'Authentication error!'}
    end
  end



  protected

  def generate_auth_link
    "#{SLACK_AUTH_URL}" \
      "?client_id=#{Figaro.env.slack_client_id}&" \
      "scope=files:write:user&"\
      "redirect_uri=#{REDIRECT_URI}"
  end

  def get_access_token
    query_string = {
      :params => {
        :client_id => Figaro.env.slack_client_id,
        :client_secret => Figaro.env.slack_client_secret,
        :code => params[:code],
        :redirect_uri => REDIRECT_URI
      }
    }

    JSON.parse RestClient.get(SLACK_ACCESS_URL, query_string)
  end

end
