require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is valid with valid attributes" do
    expect(Project.new(title: "Title for test", description: "Description for tests")).to be_valid
  end
end
