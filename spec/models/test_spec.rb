require 'rails_helper'

RSpec.describe Test, type: :model do
  describe ".test" do
    let(:instance) { Test.new }
    it "returns true" do
      expect(instance.test).to be true
    end
  end
end
