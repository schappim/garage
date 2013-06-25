ActiveAdmin.register Purchase do
  
  menu :parent => "Inventory"

  actions :all, :except => [:destroy]
end
