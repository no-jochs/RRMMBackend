release: bundle exec rails db:migrate && ./bin/build_web_client
web: bundle exec puma -C config/puma.rb
worker: bundle exec rake jobs:work
