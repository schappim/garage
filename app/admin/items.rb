ActiveAdmin.register Item do
  
  menu :parent => "Inventory"

  actions :all, :except => [:destroy]
  index  do
    column :sku do |item|
      link_to item.sku, admin_item_path(item)
    end
    column :name
    column :brand
    column :units
    default_actions
  end
end
