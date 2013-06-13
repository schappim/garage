Feature: Totals

  Show the filtered totals of each admin panel

  Scenario: Display the total costs for fuel expenses
    Given I'm logged in
      And have a set of fuel expenses
     When I view the fuel expenses page
     Then I can see the "fuel expenses" total costs

  Scenario: Display the total quantity of registries in fuel expenses
    Given I'm logged in
      And have a set of fuel expenses
     When I view the fuel expenses page
     Then I can see the "fuel expenses" total of registries

  Scenario: Display the total costs for repairs
    Given I'm logged in
      And have a set of repairs
     When I visit the "repairs" page
     Then I can see the "repairs" total costs

  Scenario: Display the total quantity of registries in repairs
    Given I'm logged in
      And have a set of repairs
     When I visit the "repairs" page
     Then I can see the "repairs" total of registries
