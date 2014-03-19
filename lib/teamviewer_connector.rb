class TeamviewerConnector

  attr_reader :client

  def initialize
    @client = connection(credentials)
  end

  def credentials
    # should be loaded from yml or something else
    hash = {}
    hash[:base_url] = 'https://webapi.teamviewer.com'
    hash[:client_id] = '16787-ea8X6tmNYc8HxP0FMsni'
    hash[:client_secret] = 'RqlaiDkVNoZR6vJuTDnB'
    hash
  end

  def connection(credentials)
    OAuth2::Client.new(
        credentials[:client_id],
        credentials[:client_secret],
        :site => credentials[:base_url],
        :authorize_url => '/api/v1/oauth2/authorize',
        :token_url => '/api/v1/oauth2/token'
    )
  end
end