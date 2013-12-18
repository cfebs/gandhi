require 'nokogiri'

doc = Nokogiri::HTML(File.open('/tmp/gandhi_table'))


row = []
doc.css('tr td').each do |cell|
  t = cell.content.gsub(/\$\s/, '$')
  next if t !~ /[^[:space:]]/
  next if t =~ /\.\.\.\./

  is_row = false

  name = nil
  desc = nil
  price = nil

  if t.match(/[a-z]/)
    is_row = true
    start_of_desc = t.index(/[a-z]/) - 1
    name = t.slice(0, start_of_desc)
    desc = t.slice(start_of_desc, t.length)

    puts name
    puts desc
    next
  end

  puts t
  puts ''
end
