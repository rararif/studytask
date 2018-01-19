class ShowforecastController < ApplicationController
  def new
    #get from UI
    @showforecast = Showforecast.new
    @showforecast = params[:showforecast]
    @city = @showforecast['cityname']
    @country = @showforecast['countryname']

    #get from BE
      #body resp from API call
    @list = Showforecast.call(@city,@country)
      #get values of temperature,humidity
    @noontempforecast = Showforecast.make_hash(@list,'temp','noontemp1',
                                               'noontemp2','noontemp3')
    @noonhumidity = Showforecast.make_hash(@list,'humidity','humidity1',
                                           'humidity2','humidity3')
      #get values of weather description
    @noonweathdescr = Showforecast.make_weathdescr_hash(@list,'description','weathdescr1',
                                                        'weathdescr2','weathdescr3')
      #get values of clouds,wind description
    @noonclouds = Showforecast.make_clouds_hash(@list,'clouds1','clouds2','clouds3')
    @noonwind = Showforecast.make_wind_hash(@list,'wind1','wind2','wind3')

    #set to UI
    @tomorrownoon = Date.tomorrow.at_noon.strftime("%d/%m/%Y %H:%M")
    @aftertomorrownoon = DateTime.tomorrow.at_noon.plus_with_duration(86400).strftime("%d/%m/%Y %H:%M")
    @afteraftertomorrownoon = DateTime.tomorrow.at_noon.plus_with_duration(172800).strftime("%d/%m/%Y %H:%M")
    render 'showforecast/index'
    end


  def index
    #get from ui
    #@cityname = params[:showforecast][:cityname]
    #@countryname = params[:showforecast][:countryname]
    #render 'showforecast/index'

    #v2
    #@showforecast = params[:showforecast][:cityname]
    #@city=params[:showforecast][:cityname]
    #@country=params[:showforecast][:countryname]


    #@city = params[:showforecast][:cityname]

  end

  def create
    showforecast = Showforecast.new(showforecast_params)
    showforecast_params
  end

private
  def showforecast_params
    params.require(:showforecast).permit(:cityname,:countryname)
  end
end


