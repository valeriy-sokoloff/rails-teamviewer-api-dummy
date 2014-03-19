class TeamviewerClient

  attr_reader :access_token

  def initialize(client, token_str)
    @client = client
    @access_token = token(token_str)
  end

  def token(str)
    OAuth2::AccessToken.new(@client, str)
  end

  #------------#
  #--- Ping ---#
  #------------#

  def ping
    get 'api/v1/ping'
  end


  #private

  def get(resource)
    response = @access_token.get(resource)
    response.parsed
  end


end