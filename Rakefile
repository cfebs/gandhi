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
    puts 'Serving on 4000'
    `jekyll serve -H 0.0.0.0 -P 4000 -w`
  end
end
