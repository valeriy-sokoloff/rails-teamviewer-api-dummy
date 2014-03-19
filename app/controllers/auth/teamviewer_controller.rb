class Auth::TeamviewerController < ApplicationController
  def index
  end

  def auth
    redirect_to client.auth_code.authorize_url(:redirect_uri => auth_teamviewer_callback_url)
  end

  def callback
    @access_token = client.auth_code.get_token(
        params[:code],
        :redirect_uri => auth_teamviewer_callback_url
    )
  end

  private

  def client
    base_url = 'https://webapi.teamviewer.com'
    client_id = '16787-ea8X6tmNYc8HxP0FMsni'
    client_secret = 'RqlaiDkVNoZR6vJuTDnB'
    @client ||= OAuth2::Client.new(
        client_id,
        client_secret,
        :site => base_url,
        :authorize_url => '/api/v1/oauth2/authorize',
        :token_url => '/api/v1/oauth2/token'
    )
  end
end
