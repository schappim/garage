ActiveAdmin.register Purchase do
  
  menu :parent => "Inventory"

  actions :all, :except => [:destroy]

  index  do
    column :sku do |purchase|
      link_to purchase.item.sku, admin_item_path(purchase.item)
    end
    column :item do |purchase|
      purchase.item.name
    end
    column :units
    column :cost_per_unit
    column :total_cost
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :item
      if f.object.new_record?
        f.input :units
      end
      f.input :cost_per_unit
      f.input :total_cost
    end
    f.actions
  end
end
