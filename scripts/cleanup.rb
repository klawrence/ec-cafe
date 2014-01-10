filename = ARGV[0]

puts filename 

text = ''
skip = false

File.open filename do |file|
  while (line = file.gets) do
    skip = false if line =~ /END WAYBACK TOOLBAR INSERT/  
    skip = true if line =~ /BEGIN WAYBACK TOOLBAR INSERT/  
    text << line unless skip
    #puts line.gsub(/[\/a-z0-9]+\/http/, 'http') if line =~ /[\/a-z0-9]+\/http/
  end
end

text.gsub! /[\/a-z0-9]+\/http/, 'http'

File.open filename, 'w' do |file|
  file.write text
end

