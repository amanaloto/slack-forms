class SessionsController < ApplicationController

  SLACK_AUTH_URL = 'https://slack.com/oauth/authorize'
  SLACK_AUTH_TEST_URL = 'https://slack.com/api/auth.test'
  SLACK_ACCESS_URL = 'https://slack.com/api/oauth.access'
  REDIRECT_URI = "#{Figaro.env.app_url}/oauth"

  before_action :redirect_to_new_form,
    :only => [:new],
    :if => :logged_in?


  def new
    @auth_link = self.generate_auth_link
  end

  def oauth
    response = self.get_access_token

    if response['ok']
      info_response = self.get_slack_user_info response['access_token']

      session[:current_slack_id] = info_response['user_id']
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

  def get_slack_user_info access_token
    query_string = {:params => {:token => access_token}}

    JSON.parse RestClient.get(SLACK_AUTH_TEST_URL, query_string)
  end

  def redirect_to_new_form
    redirect_to :new_form
  end

end
