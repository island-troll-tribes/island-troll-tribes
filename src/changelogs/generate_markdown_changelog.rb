#!/bin/env ruby

# general idea:
# take a changelog file (zn or j) and turn it into a web-formatted (markdown) file
# use regex for version number
# use regex for changes

Dir.chdir(File.dirname(__FILE__))

md = File.open 'markdown_changelog.md', 'w'

md << "# Island Troll Tribes Change Log\n\n\n"

Dir.glob("*.{zn,j}").reverse.each do |f|
  change_log = File.open(f).read

  version = change_log.scan(/ChangeLog.create\ ?\( ?(.*) ?\, ?(.*) ?\, ?\'(.*)\' ?\) ?;/).first
  changes = change_log.scan(/.(push|add) ?\( ?\"(.*)\" ?\) ?;/)

  md << "## Change Log for v#{version[0]}.#{version[1]}#{version[2]}\n\n"

  changes.each do |change|
    md << " - #{change[1].gsub('\"','"')}\n"
  end

  md << "\n"
end

puts "Output to markdown_changelog.md"