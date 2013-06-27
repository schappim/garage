ActiveAdmin.register Repair do

  menu :parent => "Vehicles"

  config.sort_order = "repaired_on_desc"
  index  do
    column :invoice do |repair|
      link_to repair.invoice, admin_repair_path(repair)
    end
    column :cost do |repair|
      number_to_currency(repair.cost, :unit => "CHF", :format => '%u %n')
    end
    column :repaired_on
    column :vehicle

    default_actions

    panel "Totals" do
      li do
        label "Registries:", :style => "display: inline-block;"
        div Repair.search(params['q']).count, :class => "total_registries", :style => "display: inline-block;"
      end
      li do 
        label "Costs:", :style => "display: inline-block;"
        div number_to_currency(Repair.search(params['q']).sum(:cost), :unit => "CHF", :format => '%u %n'), :class => "total_costs", :style => "display: inline-block;"
      end
    end

  end

  show do |repair|
    attributes_table do
      row :id
      row :invoice
      row :cost do |repair|
        number_to_currency(repair.cost, :unit => "CHF", :format => '%u %n')
      end
      row :description
      row :repaired_on
      row :vehicle
      row :hours
      row :kms
    end

    columns do
      column do
        panel "Repair Parts Used" do
          table_for repair.repair_parts do
            column :units
            column :name do |repair_part|
              link_to repair_part.item.name, admin_item_path(repair_part.item)
            end
            column :avg_price do |repair_part|
              number_to_currency(repair_part.item.avg_price, :unit => "CHF", :format => '%u %n')
            end
          end
        end
      end
    end

    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :vehicle, :as => :select
      f.input :invoice
      f.input :cost
      f.input :repaired_on, :as => :datepicker
      f.input :hours
      f.input :kms
      f.input :description
    end

    f.inputs "Repair Parts" do
      f.has_many :repair_parts do |g|
        g.input :item
        g.input :units
      end
    end

    f.actions

  end

  # Filter only by title
  filter :vehicle
  filter :invoice
  filter :repaired_on
  filter :cost
  filter :description

end
