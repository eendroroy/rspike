# frozen_string_literal: true
require 'rspikes/version'

module Rspikes
  class Spike
    def spike(data, rows = 1)
      normalized_data = normalize(data, rows)
      spiked_data = spike_data(normalized_data, rows)
      spikes = ''
      spiked_data.reverse.each_with_index do |spiked_row, index|
        spikes += print_spike(spiked_row)
        spikes += "\n" unless index + 1 >= spiked_data.length
      end
      spikes
    end

    BAR_INDEX = 8
    BARS = [' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'].freeze

    def normalize(data, rows = 1)
      upper_limit = rows * BAR_INDEX
      normalized_list = []
      max_item = data.max

      if max_item.zero?
        normalize_zero_upper(normalized_list, data, upper_limit)
      else
        normalize_positive_upper(normalized_list, data, max_item, upper_limit)
      end

      normalized_list
    end

    def normalize_zero_upper(n_list, data, upper_limit)
      data.each do |item|
        n_list << (item < upper_limit ? item : upper_limit)
      end
    end

    def normalize_positive_upper(n_list, data, max_item, upper_limit)
      data.each do |item|
        norm = Integer(((Float(item) / Float(max_item)) * upper_limit).round)
        adjusted_norm = (norm > 0 ? norm : 1)
        n_list << (item.zero? ? item : adjusted_norm)
      end
    end

    def spike_data(data, rows = 1)
      spiked = []
      (1..rows).each { spiked << [] }

      data.each do |s|
        full_rows = s / BAR_INDEX
        fractional_val = s - (full_rows * BAR_INDEX)

        (0..(full_rows - 1)).each { |full_row| spiked[full_row] << BAR_INDEX }
        spiked[full_rows] << fractional_val if full_rows < rows
        ((full_rows + 1)..(rows - 1)).each { |rest_row| spiked[rest_row] << 0 }
      end

      spiked
    end

    def print_spike(row)
      spike = ''
      row.each do |bar|
        spike += BARS[bar]
      end

      spike
    end
  end

  def self.spike(data, rows = 1)
    s = Spike.new
    s.spike(data, rows)
  end
end
