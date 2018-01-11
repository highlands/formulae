set :application, 'formulae'
ip = "formulae"
server ip, user: 'deployer', roles: %w{web db app}
