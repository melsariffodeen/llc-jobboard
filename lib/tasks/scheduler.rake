
task :update_posts => :environment do
  puts "Updating posts..."
  JobPost.hide_expired
  puts "done."
end
