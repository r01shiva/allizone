# frozen_string_literal:true

post 'authenticate', to: 'authentication#authenticate'
post 'logout', to: 'authentication#logout'
get 'app_version', to: 'authentication#app_version'

get 'all_users', to: 'user#all_users'
# get 'products', to: 'product#products'
post 'register', to: 'user#register'
