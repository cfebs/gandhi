#!/usr/bin/env ruby

require 'yaml'

## Utility Functions

# html tag helper
def tag name, content, args={}
  arg_string = ""
  args.each do |k,v|
    arg_string += " #{k}=\"#{v}\""
  end
  "<#{name}#{arg_string}>#{content}</#{name}>\n"
end

# generates a table for each menu row
# combines name and description in one <td>
def table data
  rows = "\n"
  data.each do |row|
    cells = "\n"
    cells += "  " + tag('td', tag('span', row['name']) + tag('p', row['desc']))

    cells += "  " + tag('td', row['cost'])

    rows += tag('tr', cells)
  end
  tag('table', rows, {class: 'table table-striped menu'})
end

#
# Main
#

file = File.open(ARGV.first, 'rb');

if not file
  puts "Not a valid file, try again"
  exit
end

# this is the YAML file loaded as a ruby native hash
content = YAML.load(file.read);


out = column_buffer = ""
current_column_size = 0
size = 25
cols = 0

content.each do |title, rows|
  # if we currently can fit more rows
  if current_column_size < size
    # add them to the current column
    heading = "\n" + tag('h2', title)
    column_buffer += heading + table(rows)
    current_column_size += rows.size
  end

  # if we went over the column size limit
  if current_column_size >= size
    # wrap the current column in a special column tag and add it to the output
    out += tag('div', column_buffer, {class: 'col-md-6'})
    current_column_size = 0
    column_buffer = ""
    cols += 1
  end

  # if we have reached 2 columns
  if cols == 2
    # then we can wrap the current output in a row tag
    out = tag('div', out, {class: 'row'})
    cols = 0
    current_column_size = 0
    column_buffer = ""
  end
end
# put it out
puts out
