# frozen_string_literal: true
require 'spec_helper'

describe Rspikes do
  it 'spikes data of floating numbers' do
    expect(Rspikes.spike([1.3, 2.2, 3.1, 4.4, 5.1, 0.6, 1.7, 8.1], 3)).to(
      eq("       █\n  ▁▅▇  █\n▄▇███▂▅█")
    )
    expect(Rspikes.spike([1.3, 2.2, 3.1, 4.4, 5.1, 0.6, 1.7, 8.1], 2)).to(
      eq("   ▁▂  █\n▃▄▆██▁▃█")
    )
    expect(Rspikes.spike([1.3, 2.2, 3.1, 4.4, 5.1, 0.6, 1.7, 8.1], 1)).to(
      eq('▁▂▃▄▅▁▂█')
    )
    expect(Rspikes.spike([1.3, 2.2, 3.1, 4.4, 5.1, 0.6, 1.7, 8.1], 0)).to(
      eq('')
    )
  end
end

