set :stage, :production

server '149.202.106.8:2222', user: 'deploy', roles: %w{web app db}
