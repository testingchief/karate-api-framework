function fn() {
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    // karate.configure('abortSuiteOnFailure', true);

    var config = {
        baseUrl: 'http://192.168.0.182:8080/parabank/services/bank'
    };
    config.faker = Java.type('com.github.javafaker.Faker');

    return config;
}