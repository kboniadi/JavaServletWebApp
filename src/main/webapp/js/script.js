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
    let result = parseFloat($value.text().trim().replace(/[$,]+/g, "")) - 5;
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
    let result = parseFloat($value.text().trim().replace(/[$,]+/g, "")) + 5;
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

document.addEventListener('DOMContentLoaded', function () {
    (function () {
        let sr = document.querySelectorAll('.my-star');
        let i = 0;
        //loop through stars
        while (i < sr.length) {
            //attach click event
            sr[i].addEventListener('click', function () {
                //current star
                let cs = parseInt(this.getAttribute("data-star"));
                //output current clicked star value
                document.querySelector('#output').value = cs;
                /*our first loop to set the class on preceding star elements*/
                let pre = cs; //set the current star value
                //loop through and set the active class on preceding stars
                while (1 <= pre) {
                    //check if the classlist contains the active class, if not, add the class
                    if (!document.querySelector('.star-' + pre).classList.contains('is-active')) {
                        document.querySelector('.star-' + pre).classList.add('is-active');
                    }
                    //decrement our current index
                    --pre;
                }//end of first loop

                /*our second loop to unset the class on succeeding star elements*/
                //loop through and unset the active class, skipping the current star
                let succ = cs + 1;
                while (5 >= succ) {
                    //check if the classlist contains the active class, if yes, remove the class
                    if (document.querySelector('.star-' + succ).classList.contains('is-active')) {
                        document.querySelector('.star-' + succ).classList.remove('is-active');
                    }
                    //increment current index
                    ++succ;
                }

            })//end of click event
            i++;
        }//end of while loop
    })();//end of function
})

const stateInput = document.getElementById('search_box_state');
const stateList = document.getElementById('search_result_state');

const zipInput = document.getElementById('search_box_zip');
const zipList = document.getElementById('search_result_zip');

function getTax(zip){
    if (zip.length = 5) {
        // Make Ajax call to CSV file
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                //get rid of quotations and get rid of header
                const data = this.responseText.replace(/"/g, '').split('\n').slice(1);
                let taxRate = new String;
                data.forEach((row) => {
                    const cols = row.split(',');
                    if (cols.length >= 4 && zip !== '' && cols[1].toLowerCase() == zip.toLowerCase()) {
                        taxRate = (cols[3]);
                    }
                })
                let subtotal = document.getElementById('subtotal').innerText;
                subtotal = subtotal.substring(1);
                let taxAmount = parseFloat(subtotal) * parseFloat(taxRate);
                let total = parseFloat(taxAmount)+parseFloat(subtotal);
                if(taxAmount){
                    document.getElementById('tax').innerHTML = "$"+taxAmount.toFixed(2);
                }
                if(total){
                    document.getElementById('total').innerHTML = "$"+total.toFixed(2);
                }
            }
        };
        xhr.open('GET', 'data/tax_rates2.csv', true);
        xhr.send();
    } else {
        populateZipList([])
    }
}
stateInput.addEventListener('keyup', function () {
    const search_query = this.value;
    if (search_query.length > 0) {
        // Make Ajax call to CSV file
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                const data = this.responseText.replace(/"/g, '').split('\n').slice(1);
                let suggestions = new Set();
                data.forEach((row) => {
                    const cols = row.split(',');
                    if (cols.length >= 2 && search_query !== '' && cols[1].toLowerCase().startsWith(search_query.toLowerCase()) && (zipInput.value === '' || cols[0] === zipInput.value)) {
                        suggestions.add(cols[1]);
                    }
                })
                populateStateList([...suggestions]);
            }
        };
        xhr.open('GET', 'data/zip_codes.csv', true);
        xhr.send();
    } else {
        populateStateList([])
    }
});

function populateStateList(suggestions) {
    stateList.innerHTML = '';
    if (stateInput.value !== '') {
        let html = '<div class="list-group">';
        if (suggestions.length > 0) {
            suggestions.forEach(function (suggestion) {
                html += '<a style="cursor: pointer" class="list-group-item list-group-item-action" onclick="get_text_state(this)">' + suggestion + '</a>';
            });
        } else {
            html += '<a style="cursor: pointer" class="list-group-item list-group-item-action disabled">No Data Found</a>';
        }
        html += '</div>';
        stateList.innerHTML = html
    }
}

function get_text_state(event) {
    stateInput.value = event.textContent;
    stateList.innerHTML = '';
}

zipInput.addEventListener('keyup', function () {
    const search_query = this.value;
    if (search_query.length > 0) {
        // Make Ajax call to CSV file
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                const data = this.responseText.replace(/"/g, '').split('\n').slice(1);
                let suggestions = new Set();
                data.forEach((row) => {
                    const cols = row.split(',');
                    if (cols.length >= 2 && search_query !== '' && cols[0].toLowerCase().startsWith(search_query.toLowerCase()) && (stateInput.value === '' || cols[1] === stateInput.value)) {
                        suggestions.add(cols[0]);
                    }
                })
                populateZipList([...suggestions]);
            }
        };
        xhr.open('GET', 'data/zip_codes.csv', true);
        xhr.send();
    } else {
        populateZipList([])
    }
});

function populateZipList(suggestions) {
    zipList.innerHTML = '';
    if (zipInput.value !== '') {
        let html = '<div class="list-group">';
        if (suggestions.length > 0) {
            suggestions.forEach(function (suggestion) {
                html += '<a style="cursor: pointer" class="list-group-item list-group-item-action" onclick="get_text_zip(this)">' + suggestion + '</a>';
            });
        } else {
            html += '<a style="cursor: pointer" class="list-group-item list-group-item-action disabled">No Data Found</a>';
        }
        html += '</div>';
        zipList.innerHTML = html
    }
}

function get_text_zip(event) {
    zipInput.value = event.textContent;
    zipList.innerHTML = '';
}