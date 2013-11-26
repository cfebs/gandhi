task :default => 'gah:server'

namespace :gah do
  desc "Push out to remotes"
  task :push_all do
    remotes = ['origin', 'heroku']
    remotes.each { |r| sh "git push #{r} master" }
  end

  desc "Run dev server"
  task :server do
    `rackup -s thin -p 9293`
  end
end
