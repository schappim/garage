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

  form do |f|
    f.inputs "Category" do
      f.input :name
    end

    f.inputs "Items" do
      f.has_many :items do |g|
        g.input :name
        g.input :brand
        if g.object.new_record?
          g.input :units
        end
      end
    end

    f.actions
  end
end
