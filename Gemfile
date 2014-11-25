source 'https://rubygems.org'

gem 'json', '= 1.7.7' # make berkshelf and chef play nice(r)
gem 'yajl-ruby', '= 1.1.0' # make chef and foodcritic play nice(r)

gem 'chef'
gem 'berkshelf'
gem 'pry'

group 'lint' do
  gem 'foodcritic', '> 3'
  gem 'guard-strainer'
  gem 'strainer'
  gem 'tailor'
end

group 'unit' do
  gem 'guard'
  gem 'guard-rspec'
  gem 'chefspec'
end

group 'integration' do
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
  gem 'kitchen-digitalocean'
end


group 'acceptance' do
  gem 'leibniz'
  gem 'ztk'
end
