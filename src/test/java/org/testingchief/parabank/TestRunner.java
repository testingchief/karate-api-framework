package org.testingchief.parabank;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate test01_ParabankSetup() {
        return Karate.run()
                .tags("@parabank_setup")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

    @Karate.Test
    Karate test02_ParabankLogin() {
        return Karate.run("login")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

    @Karate.Test
    Karate test03_ParabankCustomerAccounts() {
        return Karate.run("classpath:org/testingchief/parabank/accounts.feature")
                .tags("@parabank_accounts", "~@ignore")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

    @Karate.Test
    Karate test04_ParabankTransactions() {
        return Karate.run()
                .tags("@parabank_transactions")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

    @Karate.Test
    Karate test05_ParabankCustomers() {
        return Karate.run()
                .tags("@parabank_customers")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

    @Karate.Test
    Karate test06_ParabankStockPositions() {
        return Karate.run()
                .tags("@parabank_positions", "~@ignore")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

}
