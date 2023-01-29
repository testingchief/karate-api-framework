# karate-api-framework
The [ParaBank](https://parabank.parasoft.com/parabank/index.htm) demo web application and associated REST web services validated with the [Karate](https://github.com/karatelabs/karate) framework. It includes examples to send requests, validate responses and generate reports.

![karate](https://github.com/testingchief/karate-api-framework/blob/main/src/test/resources/karate.png?raw=true)

To run the tests, simply run the below maven command.
> mvn clean test -Dtest=TestRunner "-Dkarate.env=prod"