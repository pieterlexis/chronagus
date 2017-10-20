set :stage, :production

server '46.23.84.134:2222', user: 'deploy', roles: %w{web app db}
