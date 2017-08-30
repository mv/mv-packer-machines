# vim:ft=ruby:

require 'date'
# require 'json'

task :default do
  sh 'rake --tasks'
end

###
### Log:
###

logfile='/tmp/packer.log'

ENV["PACKER_LOG"] = "1"
ENV["PACKER_LOG_PATH"] = logfile

desc "tail -f #{logfile}"
task :log do
  sh "tail -f #{logfile}"
end


###
### Build:
###

ROOTDIR=__FILE__
LIBDIR="templates"
PACKERFILE="packer.template.json"

local_time = DateTime.now.strftime('%Y-%m-%d-%H%M') # `/bin/date '+%Y-%m-%d-%H%M'`.chomp

# call rake inside a specific lib/dir
machine  = ENV['machine'] || File.basename( Rake.original_dir )
template = "#{LIBDIR}/#{machine}/#{PACKERFILE}"

desc "Build a specific machine: rake build [machine='name']"
task :build do

  cmd = <<-CMD
    packer build
        -var 'ami_name=#{machine}'    \
        -var 'ami_date=#{local_time}' \
        #{template}
  CMD
  sh cmd.gsub( /\s\s+/, ' ' ).chomp
end

desc "Inspect a specific machine: rake inspect [machine='name']"
task :inspect do
  sh "packer inspect #{template}"
end

desc "Validate a specific machine: rake inspect [machine='name']"
task :validate do
  sh "packer validate #{template}"
end


###
### List
###

desc "List library of machines"
task :list do
  sh "/bin/ls -d #{LIBDIR}/*"
end


