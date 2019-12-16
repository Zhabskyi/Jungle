require 'rails_helper'

RSpec.describe Product, type: :model do

  #Set default currency settings to avoid potential issues
  Money.default_currency = 'usd'
  Money.infinite_precision = true
  Money.locale_backend = :i18n
  I18n.locale = :en


  describe 'Validations' do

    it "is save successfully with all four fields" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(category: @category, name: "Bread", price_cents: 400, quantity: 30)
      @product.save!
      expect(@product.id).to be_present
    end

    it "is not valid without a name" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(category: @category, name: nil, price_cents: 400, quantity: 30)
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(category: @category, name: "Bread", price_cents: nil, quantity: 30)
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(category: @category, name: "Bread", price_cents: 400, quantity: nil)
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(category: nil, name: "Bread", price_cents: 400, quantity: 30)
      expect(@product).to_not be_valid
    end

  end

end
