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

    @Karate.Test
    Karate testParabankTransactions() {
        return Karate.run()
                .tags("@parabank_transactions")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate testParabankCustomers() {
        return Karate.run()
                .tags("@parabank_customers")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate testParabankStockPositions() {
        return Karate.run()
                .tags("@parabank_positions")
                .relativeTo(getClass());
    }

}
