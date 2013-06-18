Feature: Vehicles

  Scenario: Vehicle years start on 1980
    Given I'm logged in
     When I go to the new vehicle page
     Then I can see years since 1980

  Scenario: Show vehicle total fuel expenses
    Given I'm logged in
     When I go to a vehicle page
     Then I can see the total costs of the related fuel expenses

  Scenario: Show vehicle total fuel expenses
    Given I'm logged in
     When I go to a vehicle page
     Then I can see the total costs of the related repairs
