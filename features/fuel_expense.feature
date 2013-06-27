Feature: Fuel Expense

  Scenario: When adding a fuel expense, the kms of the related vehicle get updated
    Given I'm logged in
      And a vehicle exists
     When I add a fuel expense registry
     Then the vehicle's kms get updated
