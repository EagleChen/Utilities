#/usr/bin/env ruby

min = 1000
target = ""
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

p "the winner goes to #{target} ( #{min} )"
