require_relative '../lib/dark_trader'

describe "The content of the currency array :" do
  it "Check if the output is an array" do
    expect(currency_table(pageUrl)).to be_an_instance_of(Array)
  end
  it "Check if 3 randoms currency are part of the array" do
    expect(currency_table(pageUrl)).to include("BTC")
    expect(currency_table(pageUrl)).to include("BSV")
    expect(currency_table(pageUrl)).to include("MKR")
  end
end

describe "The content of the values array :" do
  it "Check if the output is an array" do
    expect(values_table(pageUrl)).to be_an_instance_of(Array)
  end
end

describe "The content of the cryptohash array :" do
  it "Check if the output is an array" do
    expect(cryptohash(currency_table(pageUrl),values_table(pageUrl))).to be_an_instance_of(Array)
  end
end