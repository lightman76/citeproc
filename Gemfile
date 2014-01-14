source 'https://rubygems.org'
gemspec

group :debug do
  gem 'ruby-debug', :require => false, :platform => :jruby
  gem 'debugger', '~>1.6', :require => false, :platform => :mri
  gem 'rubinius-compiler', '~>2.0', :require => false, :platform => :rbx
  gem 'rubinius-debugger', '~>2.0', :require => false, :platform => :rbx
end

group :optional do
  gem 'chronic', '~>0.10'
  gem 'edtf', '~>2.0'

  gem 'bibtex-ruby', '~>3.0', :require => 'bibtex'

  gem 'simplecov', '~>0.8', :require => false
  gem 'rubinius-coverage', :platform => :rbx

  gem 'guard', '~>2.2'
  gem 'guard-rspec', '~>4.2'
  gem 'guard-cucumber', '~>1.4'

  gem 'unicode', '~>0.4', :platforms => [:ruby, :mswin, :mingw]

  gem 'citeproc-ruby', :git => 'https://github.com/inukshuk/citeproc-ruby.git'
end

group :development do
  gem 'rake'
  gem 'cucumber'
  gem 'rspec'
end

group :extra do
  gem 'yard', '~>0.8', :platforms => :ruby
  gem 'redcarpet', '~>3.0', :platform => :mri
end

platform :rbx do
  gem 'rubysl', '~>2.0'
  gem 'json', '~>1.8'
  gem 'racc'
end
