require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @product = Product.create(title: 'RspecTest', description: '<p>this is description</p>', price: 12)
  end

  context "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price)}
    it do
      should validate_numericality_of(:price).
        is_greater_than_or_equal_to(0)
    end

    it 'strip html from description' do
      expect(@product.description).to eq 'this is description'
    end

    it 'lowercase title' do
      expect(@product.title).to eq 'rspectest'
    end

    it 'title is shorter than description' do
      @product.title = 'this is longer than <p>this is description</p>'
      expect(@product.save).to eq false
      #expect(@product.errors.full_messages).to include 'Title must be shorter than description!'
    end
  end

  context "associations" do
    it { should belong_to(:category) }
  end
end
