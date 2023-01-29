@parabank_customers
Feature: Parabank Customers

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * call read('setup.feature@cleanDB')
    * call read('setup.feature@initializeDB')
    * def customerId = 12212

  Scenario: Get Customer Details
    Given path 'customers'
    And path customerId
    When method GET
    Then status 200
    And match response ==
    """
    {
       "id": '#(customerId)',
       "firstName": '#string',
       "lastName": '#string',
       "address": {
            "street": '#string',
            "city": '#string',
            "state": '#string',
            "zipCode": '#string'
        },
       "phoneNumber": '#string',
       "ssn": '#string'
    }
    """

  Scenario: Update Customer Details
    * def fakerObj =  new faker()
    Given path 'customers/update'
    And path customerId
    * def firstName = fakerObj.name().firstName()
    * def lastName = fakerObj.name().lastName()
    * def streetAddress = fakerObj.address().streetAddress()
    * def city = fakerObj.address().city()
    * def state = fakerObj.address().state()
    * def zipCode = fakerObj.address().zipCode()
    * def phoneNumber = fakerObj.phoneNumber().cellPhone()
    * def ssn = fakerObj.idNumber().ssnValid()
    * def userName = fakerObj.name().username()
    * def password = fakerObj.funnyName().name()
    * def parameters =
    """
    {
      firstName: '#(firstName)',
      lastName: '#(lastName)',
      street: '#(streetAddress)',
      city: '#(city)',
      state: '#(state)',
      zipCode: '#(zipCode)',
      phoneNumber: '#(phoneNumber)',
      ssn: '#(ssn)',
      username: '#(userName)',
      password: '#(password)'
    }
    """
    And params parameters
    When method POST
    Then status 200
    And match response == "Successfully updated customer profile"