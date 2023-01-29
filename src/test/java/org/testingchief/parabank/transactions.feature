@parabank_transactions
Feature: Parabank Account Transactions

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def customerId = 12212
    * def fakerObj =  new faker()

  @getTransactions
  Scenario: Get the List of Transactions
    * def customerAccounts = call read('accounts.feature@findAccounts')
    * def accountId = customerAccounts.response[0].id

    Given path 'accounts/' + accountId + '/transactions'
    When method GET
    Then status 200
    And match each response ==
    """
      {
        "id": '#number',
        "accountId": '#(accountId)',
        "type": '#string? _ =="Credit" || _ =="Debit" ',
        "date": '#string',
        "amount": '#number',
        "description": '#string'
      }
    """

  Scenario: Find Transactions by Amount
    * def txList = call read('transactions.feature@getTransactions')
    * def accountId = txList.response[0].accountId
    * def txAmount = txList.response[0].amount
    Given path 'accounts/' + accountId + '/transactions/amount/' + txAmount
    When method GET
    Then status 200
    And match each response ==
    """
      {
        "id": '#number',
        "accountId": '#(accountId)',
        "type": '#string? _ =="Credit" || _ =="Debit" ',
        "date": '#string',
        "amount": '#number',
        "description": '#string'
      }
    """

  Scenario: Find Transactions by Month and Type
    * def txList = call read('transactions.feature@getTransactions')
    * def accountId = txList.response[0].accountId
    * def txType = txList.response[0].type
    * def month = fakerObj.number().randomDigitNotZero()
    Given path 'accounts/' + accountId + '/transactions/month/' + month + '/type/' + txType
    When method GET
    Then status 200
    And match each response ==
    """
      {
        "id": '#number',
        "accountId": '#(accountId)',
        "type": '#string? _ =="Credit" || _ =="Debit" ',
        "date": '#string',
        "amount": '#number',
        "description": '#string'
      }
    """

  Scenario: Find Transactions for Date range
    * def txList = call read('transactions.feature@getTransactions')
    * def accountId = txList.response[0].accountId
    Given path 'accounts/' + accountId + '/transactions/fromDate/' + '01-01-2022' + '/toDate/' + '01-01-2023'
    When method GET
    Then status 200
    And match each response ==
    """
      {
        "id": '#number',
        "accountId": '#(accountId)',
        "type": '#string? _ =="Credit" || _ =="Debit" ',
        "date": '#string',
        "amount": '#number',
        "description": '#string'
      }
    """

  Scenario: Find Transactions for a specific Date
    * def txList = call read('transactions.feature@getTransactions')
    * def accountId = txList.response[0].accountId
    Given path 'accounts/' + accountId + '/transactions/onDate/' + '2022-12-11'
    When method GET
    Then status 200

  Scenario: Get details of Transaction by Id
    * def txList = call read('transactions.feature@getTransactions')
    * def accountId = txList.response[0].accountId
    * def txId = txList.response[0].id
    Given path 'transactions/' + txId
    When method GET
    Then status 200
    And match response ==
    """
      {
        "id": '#number',
        "accountId": '#(accountId)',
        "type": '#string? _ =="Credit" || _ =="Debit" ',
        "date": '#string',
        "amount": '#number',
        "description": '#string'
      }
    """