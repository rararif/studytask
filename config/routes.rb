Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'say/hello'=>'say#hello'
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do

    get 'weather/index'

    root 'weather#index'


    get '/forecast/index', controller: 'forecast', action: 'index'

    get '/showforecast/index',controller: 'showforecast', action: 'index'
    post '/showforecast/index', controller: 'showforecast', action:'new'


  end

  #get 'weather/index', controller: Forecast
  #post '/weather/index', controller: 'index', action: 'new'
  #get 'weather/index', controller: 'weather', action: 'index'
  #post 'weather/index', controller: 'index', action: 'create'
end
