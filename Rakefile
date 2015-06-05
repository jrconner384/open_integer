require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << %w(open_integer)
  t.test_files = FileList['test/specs/*.rb']
  t.verbose = true
end

task default: :test
