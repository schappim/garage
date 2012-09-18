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
  # Filter only by title
  filter :vehicle
  filter :invoice
  filter :repaired_on
  filter :cost
  filter :description
end
