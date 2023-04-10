# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '.Product' do
    it 'Create saves a product to the db' do
      category = Category.create(
        name: 'houseplant'
      )
      product = Product.create(
        name: 'Plant',
        price: 100,
        quantity: 2,
        category:
      )
      expect(Product.count).to eq(1)
    end

    it 'Errors if name is blank' do
      category = Category.create(
        name: 'houseplant'
      )
      product = Product.new(
        price: 100,
        quantity: 2,
        category:
      )
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
      expect(User.count).to eq(0)
    end

    it 'Errors if price is blank' do
      category = Category.create(
        name: 'houseplant'
      )
      product = Product.new(
        name: 'Plant',
        quantity: 2,
        category:
      )
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
      expect(User.count).to eq(0)
    end

    it 'Errors if quantity is blank' do
      category = Category.create(
        name: 'houseplant'
      )
      product = Product.new(
        price: 100,
        name: 'Plant',
        category:
      )
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
      expect(User.count).to eq(0)
    end

    it 'Errors if category is blank' do
      category = Category.create(
        name: 'houseplant'
      )
      product = Product.new(
        price: 100,
        quantity: 2,
        name: 'Plant'
      )
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
      expect(User.count).to eq(0)
    end
  end
end
