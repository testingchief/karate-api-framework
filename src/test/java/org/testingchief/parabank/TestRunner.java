package org.testingchief.parabank;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    @Karate.Test
    Karate testParabankSetup() {
        return Karate.run()
         .tags("@parabank_setup")
         .relativeTo(getClass());
    }

}
