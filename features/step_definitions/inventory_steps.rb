Given(/^a category exists$/) do
  @category = FactoryGirl.create(:category)
end

Given(/^an item exists$/) do
  @item = FactoryGirl.create(:item)
  @previous_item_units = @item.units
end

Given(/^the item units is grater than (\d+)$/) do |arg1|
  FactoryGirl.create(:purchase)
end

Given(/^a repair exists$/) do
  @repair = FactoryGirl.create(:repair)
end

When(/^add a new category$/) do
  @category_name = "Test Category"
  visit '/admin/categories/new'
  fill_in 'category_name', :with => @category_name
  click_on 'Create Category'
end

When(/^I add an item$/) do
  @item_name = "Test Item"
  @item_brand = "Test Brand"
  @item_units = rand(50)
  visit '/admin/items/new'
  select(@category.name, :from => 'item_category_id')
  fill_in 'item_name', :with => @item_name
  fill_in 'item_brand', :with => @item_brand
  fill_in 'item_units', :with => @item_units
  click_on 'Create Item'
  find('.flash').should have_content('Item was successfully created.')
end

When(/^I do a purchase of that item$/) do
  @purchase_units = rand(5) + 1
  @purchase_cost_per_unit = (rand() * 100).round(2)
  visit '/admin/purchases/new'
  select(@item.name, :from => 'purchase_item_id')
  fill_in 'purchase_units', :with => @purchase_units
  fill_in 'purchase_cost_per_unit', :with => @purchase_cost_per_unit
  click_on 'Create Purchase'
  find('.flash').should have_content('Purchase was successfully created.')
end

When(/^I do a withdrawal of that item$/) do
  @withdrawal_units = rand(@item.units) + 1
  @withdrawal_reason = "Cuz I say so!"
  visit '/admin/withdrawals/new'
  select(@item.name, :from => 'withdrawal_item_id')
  fill_in 'withdrawal_units', :with => @withdrawal_units
  fill_in 'withdrawal_reason', :with => @withdrawal_reason
  click_on 'Create Withdrawal'
  find('.flash').should have_content('Withdrawal was successfully created.')
end

When(/^I add a repair part$/) do
  @repair_part_units = rand(@item.units) + 1
  FactoryGirl.create(:repair_part, :units => @repair_part_units, :item => @item, :repair => @repair)
end

Then(/^the category has to be in the db$/) do
  Category.where(:name => @category_name).count.should_not == 0
end

Then(/^the item has to be in the db$/) do
  @item = Item.all.last
  @item.name.should == @item_name
  @item.brand.should == @item_brand
end

Then(/^it has to belong to the category$/) do
  @item.category.should == @category
end

Then(/^the purchase has to be in the db$/) do
  @purchase = Purchase.last
  @purchase.units.should == @purchase_units
  @purchase.cost_per_unit.to_s.should == @purchase_cost_per_unit.to_s
end

Then(/^the purchase has to belong to an item$/) do
  @item.purchases.last.should == @purchase
end

Then(/^I can see the item totals increase by the purchased units$/) do
  new_item_units = @previous_item_units + @purchase.units 
  @purchase.item.units.should == new_item_units
end

Then(/^the withdrawal has to be in the db$/) do
  @withdrawal = Withdrawal.last
  @withdrawal.units.should == @withdrawal_units
  @withdrawal.reason.should == @withdrawal_reason
end

Then(/^the withdrawal has to belong to an item$/) do
  @item.withdrawals.last.should == @withdrawal
end

Then(/^I can see the item totals decrease by the withdrawn units$/) do
  new_item_units = @previous_item_units - @withdrawal.units 
  @withdrawal.item.units.should == new_item_units
end

Then(/^the repair part has to be in the db$/) do
  @repair_part = RepairPart.last
  @repair_part.units.should == @repair_part_units
end

Then(/^the repair part has to belong to an item$/) do
  @repair_part.item.should_not == nil
end

Then(/^the repair part has to belong to that repair$/) do
  @repair.repair_parts.last.should == @repair_part
end

Then(/^I can see the item totals decrease by the quantity of repair parts used$/) do
  new_item_units = @previous_item_units - @repair_part.units 
  @repair_part.item.units.should == new_item_units
end

