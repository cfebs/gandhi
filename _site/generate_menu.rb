#!/usr/bin/env ruby

require 'yaml'
require 'pp'

file = File.open(ARGV.first, 'rb');

if not file
  puts "Not a valid file, try again"
  exit
end

content = YAML.load(file.read);
#pp content

def tag name, content, args={}
  arg_string = ""
  args.each do |k,v|
    arg_string += " #{k}=\"#{v}\""
  end
  "<#{name}#{arg_string}>#{content}</#{name}>\n"
end

def table columns, data
  rows = "\n"
  data.each do |row|
    cells = "\n"
    cells += "  " + tag('td', tag('span', row['name']) + tag('p', row['desc']))

    cells += "  " + tag('td', row['cost'])
    # not used but save
    #columns.each do |c|
      #cells += "  " + tag('td', row[c])
    #end
    rows += tag('tr', cells)
  end
  tag('table', rows, {class: 'table table-striped menu'})
end

out = ""
content.each do |title, rows|
  out += "\n" + tag('h2', title)
  out += table(['name', 'desc', 'cost'], rows)
end
puts out
