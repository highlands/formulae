set :branch, 'staging'
server 'formulae-staging', user: 'deployer', roles: %w{web db app}
