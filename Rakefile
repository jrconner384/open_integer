require 'rake/testtask'
require 'coveralls'

Rake::TestTask.new do |t|
  t.libs << %w(open_integer)
  t.test_files = FileList['test/*.rb']
  t.verbose = true

  coveralls.push!
end

task default: :test
