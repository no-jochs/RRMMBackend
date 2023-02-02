release: bundle exec rails db:migrate && ./bin/build_web_client && bundle exec rake assets:precompile
web: bundle exec puma -C config/puma.rb
