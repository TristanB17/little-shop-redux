require 'pry'

RSpec.describe 'a visitor' do
  context 'visiting the merchant dashboard' do
    it 'can see the total amount of items per merchant' do
      merchant_1 = Merchant.create(name: 'Big Lots')
      merchant_2 = Merchant.create(name: 'El Pulpo')
      item_1 = Item.create(name: 'Doorknob',
                            description: 'Made of wax, weighs 50lbs',
                            unit_price: 5,
                            merchant_id: 1,
                            image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 10,
                            merchant_id: 1,
                            image: '/images/elf_boots.jpg')
      item_3 = Item.create(name: 'Spector',
                            description: 'Totally not a secret evil organization',
                            unit_price: 5000,
                            merchant_id: 2,
                            image: '/images/Auric_Goldfinger.jpg')

      merch_stats = Merchant.merchant_statistics
      visit '/merchants/dashboard'


      expect(page).to have_content(merch_stats[0].total_number_of_items)
      expect(page).to have_content(merch_stats[1].total_number_of_items)
    end
    it 'can see average item price per merchant' do
      merchant_1 = Merchant.create(name: 'Big Lots')
      merchant_2 = Merchant.create(name: 'El Pulpo')
      item_1 = Item.create(name: 'Doorknob',
                            description: 'Made of wax, weighs 50lbs',
                            unit_price: 5,
                            merchant_id: 1,
                            image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 10,
                            merchant_id: 1,
                            image: '/images/elf_boots.jpg')
      item_3 = Item.create(name: 'Spector',
                            description: 'Totally not a secret evil organization',
                            unit_price: 5000,
                            merchant_id: 2,
                            image: '/images/Auric_Goldfinger.jpg')
      merch_stats = Merchant.merchant_statistics

      visit '/merchants/dashboard'


      expect(page).to have_content(merch_stats[0].average_item_price_for_merchant)
      expect(page).to have_content(merch_stats[1].average_item_price_for_merchant)
    end
    it 'can see the total price of items per merchant' do
      merchant_1 = Merchant.create(name: 'Big Lots')
      merchant_2 = Merchant.create(name: 'El Pulpo')
      item_1 = Item.create(name: 'Doorknob',
                            description: 'Made of wax, weighs 50lbs',
                            unit_price: 5,
                            merchant_id: 1,
                            image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 10,
                            merchant_id: 1,
                            image: '/images/elf_boots.jpg')
      item_3 = Item.create(name: 'Spector',
                            description: 'Totally not a secret evil organization',
                            unit_price: 5000,
                            merchant_id: 2,
                            image: '/images/Auric_Goldfinger.jpg')

      merch_stats = Merchant.merchant_statistics
      visit '/merchants/dashboard'

      expect(page).to have_content(merch_stats[0].total_item_cost_for_merchant)
      expect(page).to have_content(merch_stats[1].total_item_cost_for_merchant)
    end
    it 'can see the merchant with the most items' do
      merchant_1 = Merchant.create(name: 'Big Lots')
      merchant_2 = Merchant.create(name: 'El Pulpo')
      item_1 = Item.create(name: 'Doorknob',
                            description: 'Made of wax, weighs 50lbs',
                            unit_price: 5,
                            merchant_id: 1,
                            image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 10,
                            merchant_id: 1,
                            image: '/images/elf_boots.jpg')
      item_3 = Item.create(name: 'Spector',
                            description: 'Totally not a secret evil organization',
                            unit_price: 5000,
                            merchant_id: 2,
                            image: '/images/Auric_Goldfinger.jpg')

      visit '/merchants/dashboard'

      expect(page).to have_content("Merchant with most items:\n#{merchant_1.name}")
    end
    it 'can see the merchant with the most expensive item' do
      merchant_1 = Merchant.create(name: 'Big Lots')
      merchant_2 = Merchant.create(name: 'El Pulpo')
      item_1 = Item.create(name: 'Doorknob',
                            description: 'Made of wax, weighs 50lbs',
                            unit_price: 5,
                            merchant_id: 1,
                            image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 10,
                            merchant_id: 1,
                            image: '/images/elf_boots.jpg')
      item_3 = Item.create(name: 'Spector',
                            description: 'Totally not a secret evil organization',
                            unit_price: 5000,
                            merchant_id: 2,
                            image: '/images/Auric_Goldfinger.jpg')

      visit '/merchants/dashboard'

      expect(page).to have_content("Merchant with most expensive item:\n#{merchant_2.name}")
    end
  end
end
