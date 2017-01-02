class PrimeCheck {

    check(value, primeObj) {

        return primeObj[value];
    }
    isPrime(value,primeObj) {
        for (var i = 2; i <= Math.sqrt(value); i++) {
            if (value % i === 0) {
                primeObj[value] = "Number is not prime";
                return;
            }
        }
        primeObj[value] = "Number is  prime";
    }
}

primecheck = new PrimeCheck();
$(document).ready(function() {

    var add = (function() {
        var primeObj = {};
        return function() {
            return primeObj;
        }
    })();
    $("#btn").click(function() {

        value = $('#number')[0].value;

        if (!primecheck.check(value, add())) {
            primecheck.isPrime(value, add());
        }
        $("#message")[0].innerHTML = primecheck.check(value, add());
    });
});
