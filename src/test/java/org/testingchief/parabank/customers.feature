@parabank_customers
Feature: Parabank Customers

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Get Customer Details
    Given path 'customers'
    And path '12212'
    When method GET
    Then status 200

  Scenario: Update Customer Details
    Given path 'customers/update'
    And path '12212' //customerId
    And params { firstName: 'John', lastName: 'Smith', street: '10 Bay St.', city: 'San Francisco', state: 'CA', zipCode: '12345', phoneNumber: '555-555-1234', ssn: '123-456-7890', username: 'userXYZ', password: 'pass1234'}
    When method POST
    Then status 200