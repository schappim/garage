ActiveAdmin.register Item do
  
  menu :parent => "Inventory"

  actions :all, :except => [:destroy]
end
