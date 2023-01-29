package org.testingchief.parabank;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class TestRunnerParallel {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:org/testingchief/parabank")
                .tags()
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
