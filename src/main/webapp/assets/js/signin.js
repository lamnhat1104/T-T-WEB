// Validate password requirements
var myInput = document.getElementById("password");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");
var submitButton = document.querySelector(".btn--primary");

// Show the message box when focusing on the password field
myInput.onfocus = function () {
    document.getElementById("message").style.display = "block";
};

// Hide the message box when blurring the password field
myInput.onblur = function () {
    document.getElementById("message").style.display = "none";
};

// Function to check password requirements
function validatePassword() {
    var isValid = true;

    // Validate lowercase letters
    var lowerCaseLetters = /[a-z]/g;
    if (myInput.value.match(lowerCaseLetters)) {
        letter.classList.remove("invalid");
        letter.classList.add("valid");
    } else {
        letter.classList.remove("valid");
        letter.classList.add("invalid");
        isValid = false;
    }

    // Validate capital letters
    var upperCaseLetters = /[A-Z]/g;
    if (myInput.value.match(upperCaseLetters)) {
        capital.classList.remove("invalid");
        capital.classList.add("valid");
    } else {
        capital.classList.remove("valid");
        capital.classList.add("invalid");
        isValid = false;
    }

    // Validate numbers
    var numbers = /[0-9]/g;
    if (myInput.value.match(numbers)) {
        number.classList.remove("invalid");
        number.classList.add("valid");
    } else {
        number.classList.remove("valid");
        number.classList.add("invalid");
        isValid = false;
    }

    // Validate length
    if (myInput.value.length >= 8) {
        length.classList.remove("invalid");
        length.classList.add("valid");
    } else {
        length.classList.remove("valid");
        length.classList.add("invalid");
        isValid = false;
    }

    // Enable or disable the submit button
    submitButton.disabled = !isValid;
}

// Attach the keyup event to validate password dynamically
myInput.onkeyup = validatePassword;

// Prevent form submission if password is invalid
submitButton.onclick = function (event) {
    if (submitButton.disabled) {
        alert("Mật khẩu của bạn chưa hợp lệ. Vui lòng kiểm tra lại!");
        event.preventDefault(); // Prevent form submission or navigation
    }
};
