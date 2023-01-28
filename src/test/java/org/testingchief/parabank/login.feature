@parabank_login
Feature: Login to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Login
    Given path 'login'
    And path 'john'
    And path 'demo'
    When method GET
    Then status 200