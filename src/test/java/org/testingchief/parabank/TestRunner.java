package org.testingchief.parabank;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    @Karate.Test
    Karate testParabankSetup() {
        return Karate.run("Setup");
        // .tags("@setup")
        // .relativeTo(getClass());
    }

}
