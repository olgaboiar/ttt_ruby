require 'simplecov'
require 'shields_badge'

# save to CircleCI's artifacts directory if we're on CircleCI
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end
SimpleCov.start do
  add_filter 'spec'
end
SimpleCov.formatter = SimpleCov::Formatter::ShieldsBadge
