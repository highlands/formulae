set :branch, 'production'
server 'formulae', user: 'deployer', roles: %w{web db app}
