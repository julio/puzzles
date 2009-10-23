require 'digest/md5'
require 'find'

unless ARGV[0] && File.directory?(ARGV[0])
  puts "\nYou need to specify a root directory"
  exit
end

root = ARGV[0]
oldfile_hash = Hash.new
newfile_hash = Hash.new
file_report = "#{root}/analysis_report.txt"
file_output = "#{root}/file_list.txt"
oldfile_output = "#{root}/file_list.old"

if File.exists?(file_output)
  File.rename(file_output, oldfile_output)
  File.open(oldfile_output, 'rb') do |infile|
    while(temp = infile.gets)
      line = /(.+)\s{5,5}(\w{32,32})/.match(temp)
      puts "#{line[1]} ==> #{line[2]}"
      oldfile_hash[line[1]] = line[2]
    end
  end
end
