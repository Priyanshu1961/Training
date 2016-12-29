class PrimeCheck {
    constructor() {
        this.primeObj = {};
    }
    check(value) {
        return this.primeObj[value];
    }
    isPrime(value) {
        for (var i = 2; i <= Math.sqrt(value); i++) {
            if (value % i === 0) {
                this.primeObj[value] = "Number is not prime";
                return;
            }
        }
        this.primeObj[value] = "Number is  prime";
    }
}

primecheck = new PrimeCheck();

function checkPrime() {
    value = document.getElementById("number").value;
    if (!primecheck.check(value)) {
        primecheck.isPrime(value);
    }
    document.getElementById("message").innerHTML = primecheck.check(value);
}
