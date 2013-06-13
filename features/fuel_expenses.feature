Feature: Fuel Expenses

  Scenario: Display the total filtered costs
    Given I'm logged in
      And have a set of fuel expenses
     When I view the fuel expenses page
     Then I can see the total costs

  Scenario: Display the total filtered costs
    Given I'm logged in
      And have a set of fuel expenses
     When I view the fuel expenses page
     Then I can see the quantity of total expenses
