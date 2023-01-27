package org.testingchief.parabank;

import com.intuit.karate.junit5.Karate;

import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions(plugin = { "pretty", "html:target/cucumber-html-report",
        "json:target/cucumber-json-report/cucumber-json.json",
        "junit:target/cucumber-junit-report" }, features = { "src/test/java/org/testingchief/parabank/" })

public class TestRunner {

}
