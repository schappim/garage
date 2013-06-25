Feature: Inventory

  Scenario: Add an item category
    Given I'm logged in
     When add a new category
     Then the category has to be in the db

  Scenario: Add an item to a category
    Given I'm logged in
      And a category exists
     When I add an item
     Then the item has to be in the db
      And it has to belong to the category
