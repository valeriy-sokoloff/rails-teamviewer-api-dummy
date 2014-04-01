class Auth::TeamviewerController < ApplicationController

  require 'teamviewer'

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

    #
    # Here we need to save token with needed info somewhere,
    # and check when it expires.
    #
    session[:access_token] = @access_token.token
    session[:expires_at] = @access_token.expires_at
    session[:refresh_token] = @access_token.refresh_token

    redirect_to auth_teamviewer_path
  end


  #
  # Just using a simple Teamviewer's internal API method for testing - 'ping'
  #
  def test_ping
    teamviewer = Teamviewer::Client.new(client, session[:access_token])
    res = teamviewer.ping

    render json: res.inspect.to_json
  end

  private

  def client
    conn = Teamviewer::Connector.new
    conn.client
  end
end
