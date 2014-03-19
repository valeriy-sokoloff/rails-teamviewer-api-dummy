RailsTeamviewerApiDummy::Application.routes.draw do

  namespace :auth do
    get '/teamviewer' => 'teamviewer#index'
    get '/teamviewer/auth'
    get '/teamviewer/callback'

  end

  root :to => 'home#index'

end
