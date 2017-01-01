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
$(document).ready(function() {
    $("#btn").click(function() {
        value = $('#number')[0].value;

        if (!primecheck.check(value)) {
            primecheck.isPrime(value);
        }
      $("#message")[0].innerHTML = primecheck.check(value);
    });
});
