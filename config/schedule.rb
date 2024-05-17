# run rake task as cron jobs
every 1.day, :at => '5:00 am' do
  rake "-s sitemap:refresh"
end