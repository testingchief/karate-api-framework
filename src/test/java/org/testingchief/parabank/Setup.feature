@parabank @setup
Feature: Parabank REST API - Setup

  Background:
    * url baseUrl

  Scenario: Stop JMS Listener
    Given path 'shutdownJmsListener'
    When method POST
    Then status 204

  Scenario: Start JMS Listener
    * print 'Hello World'

  Scenario: Clean the Database
    * print 'Hello World'

  Scenario: Initialize the Database
    * print 'Hello World'

  Scenario: Set Parameters
    * print 'Hello World'