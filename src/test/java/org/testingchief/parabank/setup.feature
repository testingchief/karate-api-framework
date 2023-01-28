@parabank_setup
Feature: Setup Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Stop JMS Listener
    Given path 'shutdownJmsListener'
    When method POST
    Then status 204

  Scenario: Start JMS Listener
    Given path 'startupJmsListener'
    When method POST
    Then status 204

  Scenario: Clean the Database
    Given path 'cleanDB'
    When method POST
    Then status 204

  Scenario: Initialize the Database
    Given path 'initializeDB'
    When method POST
    Then status 204

  Scenario: Set Parameters
    Given path 'setParameter'
    And path 'productName' //parameter name
    And path '1234' //paramater value
    When method POST
    Then status 204