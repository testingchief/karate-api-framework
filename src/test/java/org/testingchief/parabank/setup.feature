@parabank_setup
Feature: Setup Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def fakerObj =  new faker()
    * def productName = fakerObj.company().name()
    * def productId = fakerObj.number().digits(6)

  Scenario: Stop JMS Listener
    Given path 'shutdownJmsListener'
    When method POST
    Then status 204
    And match response == ''

  Scenario: Start JMS Listener
    Given path 'startupJmsListener'
    When method POST
    Then status 204
    And match response == ''

  Scenario: Clean the Database
    Given path 'cleanDB'
    When method POST
    Then status 204
    And match response == ''

  Scenario: Initialize the Database
    Given path 'initializeDB'
    When method POST
    Then status 204
    And match response == ''

  Scenario: Set Parameters
    Given path 'setParameter'
    And path productName //parameterName
    And path productId //paramaterValue
    When method POST
    Then status 204
    And match response == ''