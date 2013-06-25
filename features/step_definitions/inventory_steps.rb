Given(/^a category exists$/) do
  @category = FactoryGirl.create(:category)
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

Then(/^the category has to be in the db$/) do
  Category.where(:name => @category_name).count.should_not == 0
end

Then(/^the item has to be in the db$/) do
  @item = Item.where(:name => @item_name).first
  @item.should_not == nil
end

Then(/^it has to belong to the category$/) do
  @item.category.name.should == @category.name
end
