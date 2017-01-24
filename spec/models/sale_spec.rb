require 'rails_helper'

describe Sale, "validations" do
  it "has a valid factory" do
    expect(build(:sale)).to be_valid
  end

  it { should validate_presence_of :discount }
  it { should validate_presence_of :status }
end

describe Sale, "associations" do
  it { should belong_to :product }
end
