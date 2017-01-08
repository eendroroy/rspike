require "spec_helper"

describe Rspikes do
  it "has a version number" do
    expect(Rspikes::VERSION).not_to be nil
  end

  it "spike data" do
    expect(Rspikes.spike([1,2,3,4,5,6,7,8], 3)).to eq("     ▂▅█\n  ▁▄▇███\n▃▆██████")
    expect(Rspikes.spike([1,2,3,4,5,6,7,8], 2)).to eq("    ▂▄▆█\n▂▄▆█████")
    expect(Rspikes.spike([1,2,3,4,5,6,7,8], 1)).to eq('▁▂▃▄▅▆▇█')
    expect(Rspikes.spike([1,2,3,4,5,6,7,8], 0)).to eq('')
  end
end
