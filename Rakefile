require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << %w(open_integer)
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end

task default: :test