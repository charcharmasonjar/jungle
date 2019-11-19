require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new(:name => "Beauty")
    end

    it "is valid with valid attributes" do
      @product = Product.new(:name => "Blush", :price => 4.00, :quantity => 11, :category => @category)
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @product = Product.new(:name => nil, :price => 4.00, :quantity => 11, :category => @category)
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @product = Product.new(:name => "Blush", :price => nil, :quantity => 11, :category => @category)
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @product = Product.new(:name => "Blush", :price => 4.00, :quantity => nil, :category => @category)
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product = Product.new(:name => "Blush", :price => 4.00, :quantity => 11, :category => nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end
