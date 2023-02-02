web: bundle exec puma -C config/puma.rb
worker: cd web_client && npm run deploy
worker: bundle exec rake jobs:work