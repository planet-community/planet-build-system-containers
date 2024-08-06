#! /usr/bin/env ruby

def pluralize(word, count=2, plural_word=nil)
  plural_word ||= "#{word}s"
  "#{count} #{(count == 1) ? word : plural_word}"
end

unless (ARGV.length == 1) &&
       (good_revision = system("git log -1 #{ARGV.first} 2>/dev/null"))
  puts "Unknown revision '#{ARGV.first}'" unless good_revision
  puts "Usage: #{File.basename __FILE__} <new_base>"
  exit 1
end

new_base = ARGV.first
tags = `git tag -l`.split("\n")
puts "Rebasing #{pluralize 'tag', tags.length} onto '#{new_base}'"
new_commits = tags.each do |t|
  commit_hash, tree_hash = `git log -1 --pretty=format:"%H %T" #{t.inspect}`.chomp.split(' ')
  identicals = `git log --pretty="%H %T" #{new_base} | grep #{tree_hash}`.chomp.split("\n")
  identicals.collect!(&:split).reject! do |commit, tree|
    # Ignore the commit that the tag currently points to.
    commit == commit_hash
  end
  if identicals.length == 1
    commit = identicals.first.first
    `git tag --force #{t} #{commit}`
    puts "Pointed tag '#{t}' at commit #{commit}"
  else
    count = identicals.empty? ? 'no' : identicals.length.to_s
    print "Can't rebase tag '#{t}' because there are #{count} identical commits on '#{new_base}'"
    puts(identicals.empty? ? '' : ':')
    identicals.each do |c|
      puts "* #{c}"
    end
  end
end