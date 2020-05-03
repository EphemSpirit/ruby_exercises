require './lib/caesar.rb'

describe "#cipher" do
  it "doesn't shift punctuation" do
    expect(cipher("hello!", 2)).to eq("jgnnq!")
  end

  it "shifts according to number passed" do
    expect(cipher("bowling", 5)).to eq("gtbqnsl")
  end

  it "wraps around the alphabet" do
    expect(cipher("xylophone", 7)).to eq("efsvwovul")
  end

  it "doesn't shift non-letters" do
    expect(cipher("!@-.", 10)).to eq("!@-.")
  end

  it "works with capital letters" do
    expect(cipher("HELLO", 2)).to eq("JGNNQ")
  end
end
