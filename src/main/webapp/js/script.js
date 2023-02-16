let valcode = document.querySelector("#discount")
let namecode = document.querySelector("#code")
namecode.textContent = valcode.value

let closeBtn = document.querySelector(".close")
let couponCode = document.querySelector(".couponCode")
closeBtn.addEventListener("click", function () {
    close()
})
valcode.addEventListener("change", function () {
    checkDiscountCoupon()
})

function checkDiscountCoupon() {
    if (valcode.value.toLowerCase() !== 'deal') {
        close()
    } else {
        couponCode.classList.remove("d-none")
        namecode.style.display = "inline"
        namecode.textContent = valcode.value
        addDiscount()
    }
}

function addDiscount() {
    let USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
    });
    let $value = $("#total")
    let result = parseFloat($value.text().trim().replace(/[$,]+/g,"")) - 5;
    $value.text(USDollar.format(result))
    $("#discount-value").text("5.00");
    $("#pay-total").text(USDollar.format(result))
}

function removeDiscount() {
    let USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
    });
    let $value = $("#total")
    let result = parseFloat($value.text().trim().replace(/[$,]+/g,"")) + 5;
    $value.text(USDollar.format(result))
    $("#discount-value").text("0.00");
    $("#pay-total").text(USDollar.format(result))
}
function close() {
    if (!couponCode.classList.contains("d-none")) {
        removeDiscount()
    }
    couponCode.classList.add("d-none")
    valcode.value = ""
}

(function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    let forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()