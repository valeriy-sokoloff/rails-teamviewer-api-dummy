class Auth::TeamviewerController < ApplicationController

  include TeamViewerConnector
  include TeamviewerClient

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
    session[:access_token] = @access_token.token
    session[:expires_at] = @access_token.expires_at
  end

  private

  def client
    conn = TeamviewerConnector.new
    conn.client
  end
end
