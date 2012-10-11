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

    panel "Totals" do
      li "Repairs: "+repairs.count.to_s
      li "Costs: "+number_to_currency(repairs.sum(:cost), :unit => "CHF", :format => '%u %n')
    end
  end

  # Filter only by title
  filter :vehicle
  filter :invoice
  filter :repaired_on
  filter :cost
  filter :description

end
