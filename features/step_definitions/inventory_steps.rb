Given(/^a category exists$/) do
  @category = FactoryGirl.create(:category)
end

Given(/^an item exists$/) do
  @item = FactoryGirl.create(:item)
  @previous_item_units = @item.units
end

When(/^add a new category$/) do
  @category_name = "Test Category"
  visit '/admin/categories/new'
  fill_in 'category_name', :with => @category_name
  click_on 'Create Category'
end

When(/^I add an item$/) do
  @item_name = "Test Item"
  visit '/admin/items/new'
  select(@category.name, :from => 'item_category_id')
  fill_in 'item_name', :with => @item_name
  fill_in 'item_brand', :with => "Bosh"
  click_on 'Create Item'
end

When(/^I do a purchase of that item$/) do
  @purchase_units = 737 
  visit '/admin/purchases/new'
  select(@item.name, :from => 'purchase_item_id')
  fill_in 'purchase_units', :with => @purchase_units
  fill_in 'purchase_cost_per_unit', :with => '98.76'
  click_on 'Create Purchase'
end


Then(/^the category has to be in the db$/) do
  Category.where(:name => @category_name).count.should_not == 0
end

Then(/^the item has to be in the db$/) do
  @item = Item.where(:name => @item_name).first
  @item.should_not == nil
end

Then(/^it has to belong to the category$/) do
  @item.category.should == @category
end

Then(/^the purchase has to be in the db$/) do
  @purchase = Purchase.where(:units => @purchase_units).first
  @purchase.should_not == nil
end

Then(/^it has to belong to an item$/) do
  @item.purchases.last.should == @purchase
end

Then(/^I can see the item totals increase by 1$/) do
  puts @previous_item_units
  puts @purchase.units
  @new_item_units = @previous_item_units + @purchase.units 
  puts @new_item_units
  Item.last.units.should == @new_item_units
end
