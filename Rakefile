require 'rake'
require 'spec/rake/spectask'
require 'rake/rdoctask'

SPEC_FILES = 'test/*.rb'
SOURCE_FILES = 'code/**/*.rb'
README = 'README.txt'
RDOC_DIR = 'doc'

desc "Run all specs with RCov."
Spec::Rake::SpecTask.new('spec_with_rcov') do |t|
  t.spec_files = FileList[SPEC_FILES]
  t.rcov = true
  t.rcov_opts = ['--exclude', 'test', '--threshold', '100', '--text-summary', '--include', SOURCE_FILES]
end

desc "Run all specs without RCov."
Spec::Rake::SpecTask.new('default') do |t|
  t.spec_files = FileList[SPEC_FILES]
end

desc "Run all specs without RCov."
Spec::Rake::SpecTask.new('spec_show') do |t|
  t.spec_opts = ['--format', 'specdoc']
  t.spec_files = FileList[SPEC_FILES]
end

desc "Run RDoc on all source files."
Rake::RDocTask.new('rdoc') do |t|
  t.rdoc_dir = RDOC_DIR
  t.main = README
  t.rdoc_files.include(README, SOURCE_FILES)
end
