task :default => 'gah:server'

namespace :gah do
  desc "Push out to remotes"
  task :push_all do
    remotes = ['origin', 'prod']
    remotes.each { |r| sh "git push #{r} master" }
  end

  desc "Updates menu html include file"
  task :gen_menu do
    `./etc/generate_menu.rb ./etc/menu.yml > ./_includes/menu.html`
  end

  desc "Run dev server"
  task :server do
    `jekyll serve -w`
  end
end
