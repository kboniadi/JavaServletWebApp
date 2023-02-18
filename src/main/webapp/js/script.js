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
    let email = document.getElementById("email").innerHTML
    const em = new RegExp("(\\S+)@(\\S+).(\\S+)");

    let cardDetail = document.getElementById("cardDetail").innerHTML
    const cd = new RegExp("(\\d{15,16})")

    let date = document.getElementById("date").innerHTML
    const d = new RegExp("(\\d{3,4})")

    let cvv = document.getElementById("cvv").innerHTML
    const c = new RegExp("(\\d{3,4})")

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {

                if (!form.checkValidity() || (!em.test(email)) || (!cd.test(cardDetail))){
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()