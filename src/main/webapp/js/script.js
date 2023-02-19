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


// Example starter JavaScript for disabling form submissions if there are invalid fields
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

document.addEventListener('DOMContentLoaded', function(){
    (function(){
        let sr = document.querySelectorAll('.my-star');
        let i = 0;
        //loop through stars
        while (i < sr.length){
            //attach click event
            sr[i].addEventListener('click', function(){
                //current star
                let cs = parseInt(this.getAttribute("data-star"));
                //output current clicked star value
                document.querySelector('#output').value = cs;
                /*our first loop to set the class on preceding star elements*/
                let pre = cs; //set the current star value
                //loop through and set the active class on preceding stars
                while(1 <= pre){
                    //check if the classlist contains the active class, if not, add the class
                    if(!document.querySelector('.star-'+pre).classList.contains('is-active')){
                        document.querySelector('.star-'+pre).classList.add('is-active');
                    }
                    //decrement our current index
                    --pre;
                }//end of first loop

                /*our second loop to unset the class on succeeding star elements*/
                //loop through and unset the active class, skipping the current star
                let succ = cs+1;
                while(5 >= succ){
                    //check if the classlist contains the active class, if yes, remove the class
                    if(document.querySelector('.star-'+succ).classList.contains('is-active')){
                        document.querySelector('.star-'+succ).classList.remove('is-active');
                    }
                    //increment current index
                    ++succ;
                }

            })//end of click event
            i++;
        }//end of while loop
    })();//end of function
})