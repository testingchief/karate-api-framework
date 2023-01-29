function fn() {
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    // karate.configure('abortSuiteOnFailure', true);

    var protocol = 'http';
    var server = '192.168.0.182:8080';
    if (karate.env == 'prod') {
        protocol = 'https';
        server = 'parabank.parasoft.com';
    }

    var config = {
        baseUrl: protocol + '://' + server + '/parabank/services/bank'
    };
    config.faker = Java.type('com.github.javafaker.Faker');

    return config;
}