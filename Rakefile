require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rails/all'

RSpec::Core::RakeTask.new('spec')

task :default => :spec
task :test => :spec

require File.expand_path('../config/application', __FILE__)
Rails.application.load_tasks