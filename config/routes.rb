# config/routes.rb

Rails.application.routes.draw do

  post '/execute_commands', to: 'spacecraft_movements#execute_commands', as: 'execute_commands'

end
