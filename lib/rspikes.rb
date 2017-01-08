require 'rspikes/version'

module Rspikes

  def self.spike(data, rows=1)
    normalized_data = normalize(data, rows=rows)
    spiked_data = spike_data(normalized_data, rows=rows)
    spikes = ''
    spiked_data.reverse.each_with_index do |spiked_row, index|
      spikes += print_spike(spiked_row)
      spikes += "\n" unless index+1 >= spiked_data.length
    end
    spikes
  end

  private

  BAR_INDEX = 8
  BARS = [' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█']

  def self.normalize(data, rows=1)
    upper_limit = rows * BAR_INDEX
    normalized_list = []

    max_item = data.max
    min_item = 0
    diff = max_item - min_item

    if diff == 0
      data.each do |item|
        normalized_list << (item < upper_limit ? item : upper_limit)
      end
    else
      data.each do |item|
        norm = Integer((((Float(item) - Float(min_item)) / Float(diff)) * upper_limit).round)
        adjusted_norm = (norm > 0 ? norm : 1)
        normalized_list << (item == 0 ? item : adjusted_norm)
      end
    end

    normalized_list
  end

  def self.spike_data(data, rows=1)
    spiked = []
    (1..rows).each do
      spiked << []
    end

    data.each do |s|
      full_rows = s/BAR_INDEX
      fractional_val = s - (full_rows * BAR_INDEX)

      (0..(full_rows-1)).each do |full_row|
        spiked[full_row] << BAR_INDEX
      end
      spiked[full_rows] << fractional_val if full_rows < rows
      ((full_rows+1)..(rows-1)).each do |rest_row|
        spiked[rest_row] << 0
      end
    end

    spiked
  end

  def self.print_spike(row)
    spike = ''
    row.each do |bar|
      spike += BARS[bar]
    end

    spike
  end

end
