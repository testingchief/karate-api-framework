@parabank_transactions
Feature: Parabank Account Transactions

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Get the List of Transactions
    Given path 'accounts'
    And path '13122' //accountId
    And path 'transactions'
    When method GET
    Then status 200

  Scenario: Find Transactions by Amount
    Given path 'accounts'
    And path '13122' //accountId
    And path 'transactions/amount'
    And path '100.00'
    When method GET
    Then status 200

  Scenario: Find Transactions by Month and Type
    Given path 'accounts'
    And path '13122' //accountId
    And path 'transactions/month'
    And path '1'
    And path 'type'
    And path 'Credit'
    When method GET
    Then status 200

  Scenario: Find Transactions for Date range
    Given path 'accounts'
    And path '13122' //accountId
    And path 'transactions'
    And path 'fromDate'
    And path '01-01-2022'
    And path 'toDate'
    And path '01-01-2023'
    When method GET
    Then status 200

  Scenario: Find Transactions for a specific Date
    Given path 'accounts'
    And path '13122' //accountId
    And path 'transactions'
    And path 'onDate'
    And path '01-27-2023'
    When method GET
    Then status 200

  Scenario: Get details of Transaction by Id
    Given path 'transactions'
    And path '12145' //transactionId
    When method GET
    Then status 200