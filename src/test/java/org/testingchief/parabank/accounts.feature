@parabank_accounts
Feature: Parabank Customer Accounts

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def customerId = 12212
    * def fakerObj =  new faker()

  @findAccounts
  Scenario: Get Customer Accounts
    Given path 'customers'
    And path customerId
    And path 'accounts'
    When method GET
    Then status 200
    * def schema =
    """
      {
          "id": '#number',
          "customerId": '#(customerId)',
          "type": '#string? _ =="CHECKING" || _ =="SAVINGS" || _ =="LOAN" ',
          "balance": '#number'
      }
    """
    And match each response[*] == schema

  Scenario: Get Account By Id
    Given path 'customers/' + customerId + '/accounts'
    When method GET
    Then status 200
    * def accountsCount = response.length
    * def accountIndex = fakerObj.number().numberBetween(0, accountsCount)
    * def accountId = response[accountIndex].id

    Given path 'accounts'
    And path accountId
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * def schema =
    """
      {
          "id": '#(accountId)',
          "customerId": '#(customerId)',
          "type": '#string? _ =="CHECKING" || _ =="SAVINGS" || _ =="LOAN" ',
          "balance": '#number'
      }
    """
    And match response == schema

  Scenario: Deposit Funds
    Given path 'customers/' + customerId + '/accounts'
    When method GET
    Then status 200
    * def accountsCount = response.length
    * def accountIndex = fakerObj.number().numberBetween(0, accountsCount)
    * def accountId = response[accountIndex].id
    * def txAmount = fakerObj.number().numberBetween(0, 1000)

    Given path 'deposit'
    And param accountId = accountId
    And param amount = txAmount
    When method POST
    Then status 200
    And match response == "Successfully deposited $" + txAmount + " to account #" + accountId

  Scenario: Transfer Funds
    Given path 'customers/' + customerId + '/accounts'
    When method GET
    Then status 200
    * def accountsCount = response.length
    * def accountIndex = fakerObj.number().numberBetween(0, accountsCount)
    * def accountId = response[accountIndex].id
    * def toAccountId = response[fakerObj.number().numberBetween(0, accountsCount)].id
    * def txAmount = fakerObj.number().randomDouble(2, 10, 100)

    Given path 'transfer'
    And param fromAccountId = accountId
    And param toAccountId = toAccountId
    And param amount = txAmount
    When method POST
    Then status 200
    And match response == "Successfully transferred $" + txAmount + " from account #" + accountId + " to account #" + toAccountId

  Scenario: Withdraw Funds
    Given path 'customers/' + customerId + '/accounts'
    When method GET
    Then status 200
    * def accountsCount = response.length
    * def accountIndex = fakerObj.number().numberBetween(0, accountsCount)
    * def accountId = response[accountIndex].id
    * def txAmount = fakerObj.number().randomDouble(2, 10, 100)

    Given path 'withdraw'
    And param accountId = accountId
    And param amount = txAmount
    When method POST
    Then status 200
    And match response == "Successfully withdrew $" + txAmount + " from account #" + accountId

  Scenario: Pay Bill
    Given path 'customers/' + customerId + '/accounts'
    When method GET
    Then status 200
    * def accountId = response[0].id
    * def txAmount = fakerObj.number().randomDouble(4, 1, 50)

    Given path 'billpay'
    And param accountId = accountId
    And param amount = txAmount
    And header Accept = 'application/json'
    * def fullName = fakerObj.name().fullName()
    * def streetAddress = fakerObj.address().streetAddress()
    * def city = fakerObj.address().city()
    * def state = fakerObj.address().state()
    * def zipCode = fakerObj.address().zipCode()
    * def phoneNumber = fakerObj.phoneNumber().cellPhone()
    And request
    """
    {
      "name": '#(fullName)',
      "address": {
        "street": '#(streetAddress)',
        "city": '#(city)',
        "state": '#(state)',
        "zipCode": '#(zipCode)'
      },
      "phoneNumber": '#(phoneNumber)',
      "accountNumber": '#(accountId)'
    }
    """
    When method POST
    Then status 200
    And match response.payeeName == fullName
    And match response.amount == txAmount
    And match response.accountId == accountId

    #clean and initialize the DB
    Given path 'cleanDB'
    When method POST
    Then status 204
    Given path 'initializeDB'
    When method POST
    Then status 204

  Scenario: Loan Approved
    Given path 'customers/' + customerId + '/accounts'
    When method GET
    Then status 200
    * def accountsCount = response.length
    * def accountIndex = fakerObj.number().numberBetween(0, accountsCount)
    * def accountId = response[accountIndex].id
    * def loanAmount = fakerObj.number().numberBetween(1000, 10000)
    * def downPayment = loanAmount * 0.25

    Given path 'requestLoan'
    And param customerId = customerId
    And param amount = loanAmount
    And param downPayment = downPayment
    And param fromAccountId = accountId
    And header Accept = 'application/json'
    When method POST
    Then status 200
    * def schema =
    """
      {
        responseDate: '#string',
        loanProviderName: '#string',
        approved: true,
        accountId: '#number'
      }
    """
    And match response == schema


  Scenario: Loan Rejected
    Given path 'customers/' + customerId + '/accounts'
    When method GET
    Then status 200
    * def accountsCount = response.length
    * def accountIndex = fakerObj.number().numberBetween(0, accountsCount)
    * def accountId = response[accountIndex].id
    * def loanAmount = fakerObj.number().numberBetween(1000, 10000)
    * def downPayment = loanAmount * 0.01

    Given path 'requestLoan'
    And param customerId = customerId
    And param amount = loanAmount
    And param downPayment = downPayment
    And param fromAccountId = accountId
    And header Accept = 'application/json'
    When method POST
    Then status 200
    * def schema =
    """
      {
        responseDate: '#string',
        loanProviderName: '#string',
        approved: false,
        message: 'error.insufficient.funds.for.down.payment',
        accountId: '#null'
      }
    """
    And match response == schema

  Scenario: Create a New Account
    Given path 'customers/' + customerId + '/accounts'
    When method GET
    Then status 200
    * def accountsCount = response.length
    * def accountIndex = fakerObj.number().numberBetween(0, accountsCount)
    * def accountId = response[accountIndex].id

    Given path 'createAccount'
    And param customerId = customerId
    And param newAccountType = 0
    And param fromAccountId = accountId
    And header Accept = 'application/json'
    When method POST
    Then status 200
    * def schema =
    """
      {
        id: '#number',
        customerId: '#(customerId)',
        type: '#string? _ =="CHECKING" || _ =="SAVINGS" || _ =="LOAN" ',
        balance: 0
      }
    """
    And match response == schema
