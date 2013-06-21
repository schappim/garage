ActiveAdmin.register_page "Dashboard" do


  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    # div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #   span :class => "blank_slate" do
    #     span "Welcome to Active Admin. This is the default dashboard page."
    #     small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
    #   end
    # end
  within @head do
    #script :src => "https://www.google.com/jsapi", :type => "text/javascript"
    #script :src => "chartkick", :type => "text/javascript"
    #javascript_include_tag "https://www.google.com/jsapi", "chartkick"
  end

    columns do

      column do
        panel "Monthly Expenses" do
          div column_chart [FuelExpense.graph, Repair.graph], :library => {
            :backgroundColor => "#eee",
            :isStacked => true,
            :hAxis => {
              :title => 'Month',
              :titleTextStyle => {
                :color => 'black'
              }
            },
            :vAxis => {
              :title => 'CHF',
              :titleTextStyle => {
                :color => 'black'
              }
            }
          }
        end
      end

    end
  end # content
end
