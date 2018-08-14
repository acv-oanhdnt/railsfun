require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
  context "association" do
    it { should have_many(:products)}
  end
end
