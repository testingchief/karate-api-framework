@parabank_accounts
Feature: Parabank Customer Accounts

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Get Customer Accounts
    Given path 'customers'
    And path '12212' //customerId
    And path 'accounts'
    When method GET
    Then status 200

  Scenario: Get Account By Id
    Given path 'accounts'
    And path '13122' //customerId
    When method GET
    Then status 200

  Scenario: Deposit Funds
    Given path 'deposit'
    And param accountId = '13122'
    And param amount = '100.00'
    When method POST
    Then status 200
