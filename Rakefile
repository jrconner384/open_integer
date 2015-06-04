require 'rake/testtask'
require 'coveralls'

Rake::TestTask.new do |t|
  t.libs << %w(open_integer)
  t.test_files = FileList['test/*.rb']
  t.verbose = true

  Coveralls.push!
end

task default: :test
