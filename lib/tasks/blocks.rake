namespace :blocks do
  desc "Deletes expired messages"
  task :delete_expired => :environment do
    Block.delete_expired
  end
end