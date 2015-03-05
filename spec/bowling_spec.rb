require "bowling"

describe "Bowling" do

  let(:b) { Bowling.new }

  it "Calculates single roll" do
    expect(b.result("2")).to eq 2
  end

  it "Calculates multiple rolls" do
    expect(b.result("23")).to eq 5
    expect(b.result("12341234")).to eq 20
  end

  it "Calculates single spare" do
    expect(b.result("5/")).to eq 10
  end

  it "Calculates spare on other tries" do
    expect(b.result("275/")).to eq (2+7)+(10+7)
    expect(b.result("5/5/")).to eq (5+5)+(5+5+5)
    expect(b.result("5/5/5/5/5/5/5/5/5/5/5")).to eq 150
  end

  it "Calculates single strike" do
    expect(b.result("X-")).to eq 10
  end

  it "Calculates multiple strikes" do
    expect(b.result("12X-")).to eq (1+2)+(10+2+1)
    expect(b.result("X-X-")).to eq (10)+(10+10+0)
    expect(b.result("2/X-")).to eq (10)+(10+8+2)
    expect(b.result("X-X-X-")).to eq (10)+(10+10+0)+(10+10+10)
  end

end
