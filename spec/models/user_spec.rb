require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be not created without attributes" do
    expect(User.new()).to_not be_valid
  end
  it "should create user with attributes" do
    expect(User.new(first_name: "Iana", last_name: "Alekseeva", email: "test@gmail.com", password: "123456")).to be_valid
  end
  it "should call the method username and generate the proper username" do
    expect(User.new(first_name: "Iana", last_name: "Alekseeva", email: "test@gmail.com", password: "123456").username).to eq("@test")
  end
end
