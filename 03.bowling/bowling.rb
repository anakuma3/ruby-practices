#!/usr/bin/env ruby

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each_with_index.each do |frame,index|
  count = index
  if frame[0] == 10 && count < 9 # strike
    #次のフレームの２投を加算
    point += frame.sum + frames[count + 1].sum
  elsif frame.sum == 10 && count < 9 # spare
    # 次のフレームの１投目を加算
    point += frame.sum + frames[count + 1][0]
  else
    point += frame.sum
  end

end
puts point
