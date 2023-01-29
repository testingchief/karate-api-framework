@parabank_positions
Feature: Parabank Stock Positions

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Get Positions for Customer
    Given path 'customers'
    And path '12212' //customerId
    And path 'positions'
    When method GET
    Then status 200

  Scenario: Get Position by Id
    Given path 'positions'
    And path '12345' //positionId
    When method GET
    Then status 200

#  Scenario: Get Position History by Id within a Date range
#    Given path 'positions'
#    And path '12345' //positionId
#    And path '01-28-2023'
#    And path '01-28-2023'
#    When method GET
#    Then status 200

  Scenario: Buy a Position
    Given path 'customers'
    And path '12212' //customerId
    And path 'buyPosition'
    And params { accountId: 12345, name: 'AMR Corp.', symbol: 'CSX', shares: 10, pricePerShare: 5.99 }
    When method POST
    Then status 200

  Scenario: Sell a Position
    Given path 'customers'
    And path '12212' //customerId
    And path 'sellPosition'
    And params { accountId: 12345, positionId: 12345, shares: 10, pricePerShare: 2.45 }
    When method POST
    Then status 200