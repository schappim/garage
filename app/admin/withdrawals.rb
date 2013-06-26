ActiveAdmin.register Withdrawal do

  menu :parent => "Inventory"

  actions :all, :except => [:destroy]

end
