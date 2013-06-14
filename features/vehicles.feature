Feature: Vehicles

  Scenario: Vehicle years start on 1980
    Given I'm logged in
     When I go to the new vehicle page
     Then I can see years since 1980
