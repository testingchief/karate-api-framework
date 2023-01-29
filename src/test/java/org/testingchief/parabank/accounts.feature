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

  Scenario: Transfer Funds
    Given path 'transfer'
    And param fromAccountId = '13122'
    And param toAccountId = '12345'
    And param amount = '100.00'
    When method POST
    Then status 200

  Scenario: Withdraw Funds
    Given path 'withdraw'
    And param accountId = '13122'
    And param amount = '100.00'
    When method POST
    Then status 200

  Scenario: Pay Bill
    Given path 'billpay'
    And param accountId = '13122'
    And param amount = '100.00'
    And request
    """
    {
      "name": "John Smith",
      "address": {
        "street": "100 Bay Street",
        "city": "Toronto",
        "state": "ON",
        "zipCode": "12345"
      },
      "phoneNumber": "555-555-1234",
      "accountNumber": 123456
    }
    """
    When method POST
    Then status 200

  Scenario: Request Loan
    Given path 'requestLoan'
    And param customerId = '12212'
    And param amount = '1000.00'
    And param downPayment = '100.00'
    And param fromAccountId = '13122'
    When method POST
    Then status 200

  @ignore
  Scenario: Create a New Account
    Given path 'createAccount'
    And param customerId = '12212'
    And param newAccountType = 'SAVINGS'
    And param fromAccountId = '13122'
    When method POST
    Then status 200