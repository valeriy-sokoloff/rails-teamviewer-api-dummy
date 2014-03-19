RailsTeamviewerApiDummy::Application.routes.draw do

  namespace :auth do
    get '/teamviewer' => 'teamviewer#index'
    get '/teamviewer/auth'
    get '/teamviewer/callback'
    get '/teamviewer/test_ping'
  end

  root :to => 'auth/teamviewer#index'

end
