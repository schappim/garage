ActiveAdmin.register Repair do

  config.sort_order = "repaired_on_desc"
  index  do
    column :invoice do |repair|
      link_to repair.invoice, admin_repair_path(repair)
    end
    column :cost
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

  form do |f|
    f.inputs do
      f.input :vehicle, :as => :select
      f.input :invoice
      f.input :cost
      f.input :repaired_on, :as => :datepicker
      f.input :hours
      f.input :kms
      f.input :description
      f.buttons
    end

  end

  # Filter only by title
  filter :vehicle
  filter :invoice
  filter :repaired_on
  filter :cost
  filter :description

end
