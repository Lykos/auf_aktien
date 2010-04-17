require 'rake'
require 'spec/rake/spectask'

desc "Run all specs with RCov"
Spec::Rake::SpecTask.new('test_with_rcov') do |t|
  t.spec_files = FileList['test/*.rb']
  t.spec_opts = ['--format', 'specdoc']
  t.rcov = true
  t.rcov_opts = ['--exclude', 'test', '--threshold', '100', '--text-summary']
end
