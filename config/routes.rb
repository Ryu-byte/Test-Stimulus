Rails.application.routes.draw do

  resource :converter, only: :show
  resource :exchange_rates, only: :show

  root 'converter#show'

end
