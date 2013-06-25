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

@wip
  Scenario: Add a purchase of an item
    Given I'm logged in
      And an item exists
     When I do a purchase of that item
     Then the purchase has to be in the db
      And it has to belong to an item
      And I can see the item totals increase by 1
