#!/usr/bin/env ruby
# coding: utf-8

kernel = [
    [0.02, 0.2, 0.8, 1.0, 0.8, 0.2, 0.02],
    [0.5, 1.0, 0.5],
    [0.5, 1.0, 0.5],
    [0.5, 1.0, 0.5]
]

kernel.each do |k|
    ks = k.inject(:+)
    k.map! { |e| e /= ks }
end

GNUPLOT = true

data = Array.new(31, 0.0)
data[15] = 1.0

odata = data

ki = 0

(0..3).to_a.reverse.each do |i|
    e = 2 ** i

    ndata = Array.new(31)

    data.each_index do |j|
        ndata[j] = 0.0

        kernel[ki].each_index do |k|
            rj = j + (k - (kernel[ki].length - 1) / 2) * (e / ((kernel[ki].length - 1) / 2))

            ndata[j] += data[rj] * kernel[ki][k] if rj >= 0 && rj < 31
        end
    end

    ki += 1

    data = ndata

    if GNUPLOT
        puts data.map.with_index { |e, j| "%i %.10f" % [j - 15, e] } * "\n"
        puts
    else
        puts data.map.with_index { |e, j| "%.10f" % e } * ' '
    end
end

normal_sum = Math.exp(0)
(1..30).each do |i|
    normal_sum += 2.0 * Math.exp(-(i / 5.0) ** 2)
end

ndata = Array.new(31)
odata.each_index do |j|
    ndata[j] = 0.0

    odata.each_index do |k|
        ndata[j] += odata[k] * Math.exp(-((k - j) / 5.0) ** 2) / normal_sum
    end
end

if GNUPLOT
    puts ndata.map.with_index { |e, i| "%i %.10f" % [i - 15, e] } * "\n"
else
    puts ndata.map.with_index { |e, i| "%.10f" % e } * ' '
end
