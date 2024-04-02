#!/usr/bin/env ruby
# frozen_string_literal: true

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
frames.each_with_index do |frame, count|
  point += frame.sum
  if count < 9
    # ２投連続でストライクの場合
    if frame[0] == 10 && frames[count + 1][0] == 10
      point += frames[count + 1].sum + frames[count + 2][0]
    elsif frame[0] == 10 # strike
      # 次のフレームの２投を加算
      point += frames[count + 1].sum
    elsif frame.sum == 10 # spare
      # 次のフレームの１投目を加算
      point += frames[count + 1][0]
    end
  end
end

puts point
