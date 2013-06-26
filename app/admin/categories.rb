ActiveAdmin.register Category do
  
  menu :parent => "Inventory"

  show do |category|
    attributes_table do
      row :id
      row :name
    end

    columns do
      column do
        panel "Items" do
          table_for category.items  do 
            column :name do |item|
              link_to item.name, admin_item_path(item)
            end
            column :brand
            column :units
          end
        end
      end
    end

  end
end
