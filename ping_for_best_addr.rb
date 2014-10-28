#/usr/bin/env ruby

min = 1000
target = ""
t = Thread.new do
  marks = ["|", "/", "-", "\\"]
  i = 0
  size = marks.size
  loop do
    printf "#{marks[i]} testing, please be patient#{"." * i + " " * (size - i)}\r"
    sleep 0.5
    i += 1
    i = 0 if i >= size
  end
end

(1..21).each do |i|
  next if i == 17
  addr = "s#{i}.123ssh.net"
  result = `ping -c 3 -q -W 2 #{addr}`
  avg = result[/=\W.+?\/(.+?)\//, 1].to_f
  next if avg == 0.0
  if avg < min
    target = addr
    min = avg
  end
end

t.exit
puts "the winner goes to #{target} ( #{min} ms)"
