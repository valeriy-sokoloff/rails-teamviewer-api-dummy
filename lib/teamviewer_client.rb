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


  #-------------#
  #--- Users ---#
  #-------------#

  def users(params = nil)
    get 'api/v1/users', params
  end

  def user_add(data)
    post 'api/v1/users', data
  end

  def user_get(id)
    get "api/v1/users/#{id}"
  end

  def user_update(id, data)
    put "api/v1/users/#{id}", data
  end


  #----------------#
  #--- Sessions ---#
  #----------------#

  def sessions(params = nil)
    get 'api/v1/sessions', params
  end

  def session_add(data)
    post 'api/v1/sessions', data
  end

  def session_get(code)
    get "api/v1/sessions/#{code}"
  end

  def session_update(code)
    put "api/v1/sessions/#{code}", data
  end


  #--------------------------#
  #--- Connection Reports ---#
  #--------------------------#

  def reports(params = nil)
    get 'api/v1/reports/connections', params
  end

  def report_update(id, data)
    put "api/v1/reports/connections/#{id}", data
  end

  def report_delete(id)
    delete "api/v1/reports/connections/#{id}"
  end


  #----------------#
  #--- Meetings ---#
  #----------------#

  def meetings(params = nil)
    get 'api/v1/meetings', params
  end

  def meeting_get(id)
    get "api/v1/meetings/#{id}"
  end

  def meeting_invitation(id, params)
    get "api/v1/meetings/#{id}/invitation", params
  end

  def meeting_new(data)
    post 'api/v1/meetings', data
  end

  def meeting_update(id, data)
    put "api/v1/meetings/#{id}", data
  end

  def meeting_delete(id)
    delete "api/v1/meetings/#{id}"
  end



  #private

  def get(resource, params = nil)
    response = @access_token.get(resource, :params => params)
    response.parsed
  end

  def post(resource, data)
    response = @access_token.post( resource, JSON.generate(data) )
    response.status == 200 ? response.parsed : response.status
  end

  def put(resource, data)
    response = @access_token.put( resource, JSON.generate(data) )
    response.status
  end

  def delete(resource)
    @access_token.delete( resource )
  end



  end