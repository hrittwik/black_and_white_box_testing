Feature: CoffeeMakerFeature



Scenario Outline: Waiting State
      Priority: 1 Story Points: 2
     
    
      
   Given an empty recipe book
   When the user press <key> key   
   Then cofee maker is in the <mode> mode
   Examples:
| key | mode               | 
| 0   |  WAITING           |
| 1   |  ADD_RECIPE        |
| 2   |  DELETE_RECIPE     |
| 3   |  EDIT_RECIPE       |
| 4   |  ADD_INVENTORY     |
| 5   |  CHECK_INVENTORY   |
| 6   |  PURCHASE_BEVERAGE |
| 7   |  WAITING           |

   
Scenario: Add a Recipe
      Priority: 1 Story Points: 2

     
   Given an empty recipe book
   When the coffee maker is in ADD_RECIPE mode
   And the user adds a recipe
   |   name   |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | hoclate  | 50    |   1        |   1     |   1      |  3           |
   Then cofee maker status is OK
   And cofee maker is in the WAITING mode
   
   
   
   
   Scenario: Add a Recipe minus
   
   Given an empty recipe book
   When the coffee maker is in ADD_RECIPE mode
   And the user adds a recipe
   |   name   |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | hoclate  | -50   |    -1      |   -1    |   -1     |     -3       |
   Then cofee maker is in the WAITING mode
   And cofee maker status is RECIPE_NOT_ADDED
   
   
   
   Scenario: Add a Recipe interrupt
   
   Given an empty recipe book
   When the coffee maker is in ADD_RECIPE mode
   And user wants to reset
   Then cofee maker is in the WAITING mode
   
   Scenario: Add duplicate Recipe
   
   Given an empty recipe book
   When the coffee maker is in ADD_RECIPE mode
   And the user adds a recipe
   |   name   |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | hoclate  | 50    |   1        |   1     |   1      |  3           |
   And the coffee maker is in ADD_RECIPE mode
   And the user adds a recipe
   |   name   |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | hoclate  | 50    |   1        |   1     |   1      |  3           |
   Then cofee maker status is RECIPE_NOT_ADDED
   And cofee maker is in the WAITING mode
   
   Scenario: Add over size Recipe
   
    Given a default recipe book
    When the coffee maker is in ADD_RECIPE mode
    And the user adds a recipe
   |   name   |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | hoclate  | 50    |   1        |   1     |   1      |  3           |
   Then cofee maker status is RECIPE_NOT_ADDED
   And cofee maker is in the WAITING mode
   
   Scenario: Add over size 3 Recipe
   
   Given an empty recipe book
   When the coffee maker is in ADD_RECIPE mode
   And the user adds a recipe
   |   name    |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | hoclate1  | 50    |   1        |   1     |   1      |  3           |
   And the coffee maker is in ADD_RECIPE mode
   And the user adds a recipe
   |   name    |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | hoclate2  | 50    |   1        |   1     |   1      |  3           |
   And the coffee maker is in ADD_RECIPE mode
   And the user adds a recipe
   |   name    |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | hoclate3  | 50    |   1        |   1     |   1      |  3           |
   And the coffee maker is in ADD_RECIPE mode
   And the user adds a recipe
   |   name    |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | hoclate4  | 50    |   1        |   1     |   1      |  3           |
   Then cofee maker is in the WAITING mode
   And cofee maker status is RECIPE_NOT_ADDED
   
   
   
 
   
   
   
   
Scenario: Delete a Recipe
      Priority: 2 Story Points: 1

   state.  
     

   Given a default recipe book
   When the user press 2 key
   And user wants to delete recipe number 1 
   Then cofee maker status is OK
   And verify deletion of 1
   And cofee maker is in the WAITING mode
   




Scenario: Delete a Recipe interrupt

Given a default recipe book
   When the user press 2 key
And user wants to reset
Then cofee maker status is OK
And cofee maker is in the WAITING mode

     



Scenario: Delete out of bounds Recipe

Given a default recipe book
When the user press 2 key
   And user wants to delete recipe number 5 
   Then cofee maker is in the WAITING mode
   
   

   
   
   Scenario: Delete empty Recipe
   
   Given an empty recipe book
   When the user press 2 key
   And user wants to delete recipe number 1
   Then cofee maker is in the WAITING mode
   
   
   
    
   
   
   
   
Scenario: Edit a Recipe
      Priority: 2 Story Points: 1

   

   Given a default recipe book
   When the user press 3 key
   And user wants to edit recipe number 1
   And cofee maker  in the EDIT_RECIPE mode
   And the user adds a recipe
   |   name   |price  |  amtCoffee | amtMilk | amtSugar | amtChocolate |
   | Coffee   | 25    |   1        |   1     |   1      |  3           |
   Then cofee maker status is OK
   And cofee maker is in the WAITING mode
   And check values
   
   
   
   
   Scenario: Edit a Recipe interrupt
   
   
    Given a default recipe book
   When the user press 3 key
   And user wants to edit recipe number 1
   And cofee maker  in the EDIT_RECIPE mode
 And user wants to reset
 Then cofee maker status is OK
   And cofee maker is in the WAITING mode
   
   
   
   Scenario: Edit a Recipe that don't exist
   
   Given an empty recipe book
   When the user press 3 key
   And user wants to edit recipe number 5
   Then cofee maker status is OUT_OF_RANGE
   And cofee maker is in the WAITING mode
   
   
Scenario: Add Inventory
      Priority: 1 Story Points: 2

      
      
  
Given an empty recipe book
   When cofee maker  in the ADD_INVENTORY mode
   And user adds this inventory values
  | amtCoffee | amtMilk | amtSugar | amtChocolate |
  |    5      |   5     |   5      |    5         | 
  Then inventory increased by 5
  Then cofee maker status is OK
  Then cofee maker is in the WAITING mode
  
  
  
  
  
  
  
  Scenario: Add interrupt Inventory
  
  Given an empty recipe book
   When cofee maker  in the ADD_INVENTORY mode
   And user wants to reset
  Then cofee maker is in the WAITING mode
  
  
  
  
 Scenario: Add negative Inventory
  Given an empty recipe book
   When cofee maker  in the ADD_INVENTORY mode
   And user adds this inventory values
  | amtCoffee  | amtMilk  | amtSugar  | amtChocolate  |
  |    -1      |   -5     |   -5      |    -5         | 
  Then cofee maker status is OUT_OF_RANGE
  And cofee maker is in the ADD_INVENTORY mode


  
  


Scenario: Check Inventory 
      Priority: 2 Story Points: 1

    
      
      
   Given a default recipe book
   When cofee maker  in the CHECK_INVENTORY mode
   And user check inventory
   Then inventory increased by 0
   And cofee maker status is OK
   And cofee maker is in the WAITING mode
   
   
   Scenario: Check Inventory  interrupt
   
   Given a default recipe book
   When cofee maker  in the CHECK_INVENTORY mode
   And user wants to reset
   Then cofee maker is in the WAITING mode
   
   
Scenario: Purchase Beverage
      Priority: 1 Story Points: 2

      
     
   
   
   Given a default recipe book
   When the coffee maker is in PURCHASE_BEVERAGE mode
   And user inserts 50 dollars 
   When the coffee maker is in PURCHASE_BEVERAGE mode
   And user selects recipe number 1
    Then recipe 1 purchase should be successful
   And cofee maker status is OK
   And cofee maker is in the WAITING mode
   
   
   
   Scenario: Purchase Beverage interrupt
   
    Given a default recipe book
   When the coffee maker is in PURCHASE_BEVERAGE mode
   And user inserts 50 dollars 
   When the coffee maker is in PURCHASE_BEVERAGE mode
   And user wants to reset
   Then cofee maker status is OK
   And cofee maker is in the WAITING mode
   
   
   
   
   Scenario: Purchase Beverage with change
      
   Given a default recipe book
   When the coffee maker is in PURCHASE_BEVERAGE mode
   And user inserts 75 dollars 
   And the coffee maker is in PURCHASE_BEVERAGE mode
   And user selects recipe number 1 
  And the coffee maker is in PURCHASE_BEVERAGE mode
   Then return change of 75 fo recipe 1
    And cofee maker status is OK
   And cofee maker is in the WAITING mode
   
   
   Scenario: Failed Purchase Beverage_inventory
   Priority: 1 Story Points: 1
   
   Given a default recipe book
   When the coffee maker is in PURCHASE_BEVERAGE mode
   And user inserts 75 dollars 
   When the coffee maker is in PURCHASE_BEVERAGE mode
   And user selects recipe number 2
   Then inventory increased by 0 
   And cofee maker status is INSUFFICIENT_FUNDS
   And cofee maker is in the WAITING mode
   
   
   
  
  
Scenario: Failed Purchase Beverage_money
   Priority: 1 Story Points: 1
   
   Given a default recipe book
   When the coffee maker is in PURCHASE_BEVERAGE mode
   And user inserts 0 dollars 
   When the coffee maker is in PURCHASE_BEVERAGE mode
   And user selects recipe number 1
   Then inventory increased by 0 
   And cofee maker status is INSUFFICIENT_FUNDS
   And cofee maker is in the WAITING mode