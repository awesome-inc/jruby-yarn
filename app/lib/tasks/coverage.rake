namespace :test do

  desc 'Run unit test coverage'
  task :coverage do
    ENV['COVERAGE'] = 'true'
    require 'simplecov'
    require 'simplecov-rcov'

    SimpleCov.coverage_dir('public/coverage')

    SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
    Rake::Task['test'].execute
  end
end
