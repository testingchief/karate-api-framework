![Build](http://img.shields.io/badge/release-1.0-GREEN.svg)
![Maven](https://github.com/testingchief/karate-api-framework/workflows/maven-build/badge.svg)
![Karate](http://img.shields.io/badge/karate-1.3.1-GREEN.svg)
[![SonarCloud](https://img.shields.io/sonar/quality_gate/testingchief_karate-api-framework/main?server=https%3A%2F%2Fsonarcloud.io)](https://sonarcloud.io/summary/new_code?id=testingchief_karate-api-framework)

![GitHub](https://img.shields.io/github/stars/testingchief/karate-api-framework?style=social)
![Twitter](http://img.shields.io/badge/@testingchief--lightgrey?logo=twitter&amp;style=social)

# karate-api-framework
The [ParaBank](https://parabank.parasoft.com/parabank/index.htm) demo web application and associated REST web services validated with the [Karate](https://github.com/karatelabs/karate) framework. It includes examples to send requests, validate responses and generate reports.

![karate](https://github.com/testingchief/karate-api-framework/blob/main/src/test/resources/karate.png?raw=true)

To run the tests, simply run the below maven command.
> mvn clean test -Dtest=TestRunner "-Dkarate.env=prod"
