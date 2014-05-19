namespace :searches do
  desc "Generate search suggestions from products"
  task :index => :environment do
    Search.index_users
  end
end