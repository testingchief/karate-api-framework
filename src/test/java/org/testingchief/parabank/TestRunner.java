package org.testingchief.parabank;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testParabankSetup() {
        return Karate.run()
         .tags("@parabank_setup")
         .relativeTo(getClass());
    }

    @Karate.Test
    Karate testParabankLogin() {
        return Karate.run()
                .tags("@parabank_login")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate testParabankCustomerAccounts() {
        return Karate.run()
                .tags("@parabank_accounts")
                .relativeTo(getClass());
    }
}
