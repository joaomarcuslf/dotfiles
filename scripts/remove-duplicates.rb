#!/usr/bin/env ruby

ARGV.each do |a|
  begin
    puts "Editing file: #{a}"

    lines = File.readlines(a).uniq

    File.open(a, 'w+') do |f|
      f.puts(lines)
    end
  rescue StandardError
    puts "| Could not open file: #{a}"
    next
  end
end
