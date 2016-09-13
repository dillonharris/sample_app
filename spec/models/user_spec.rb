require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_length_of(:email).is_at_most(255) }
  it { should validate_presence_of(:name) }

  describe ".new_token" do
    it "returns the random token" do
      expect(User.new_token.length).to eq 22
    end
  end
end
