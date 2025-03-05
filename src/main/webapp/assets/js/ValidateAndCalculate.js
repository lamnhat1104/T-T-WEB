const rentalStartDateInput = document.getElementById("rentalStartDate");
const expectedReturnDateInput = document.getElementById("expectedReturnDate");
const totalPriceElement = document.getElementById("totalPrice");

const today = new Date();
const todayFormatted = today.toISOString().split("T")[0];

document.addEventListener("DOMContentLoaded", function() {
    const rentalStartDateInput = document.getElementById("rentalStartDate");
    const today = new Date();
    const todayFormatted = today.toISOString().split("T")[0];

    rentalStartDateInput.min = todayFormatted; // Ngày bắt đầu tối thiểu là hôm nay
    rentalStartDateInput.value = todayFormatted;
});


function validateAndCalculate() {
    const rentalStartDateInput = document.getElementById("rentalStartDate");
    const expectedReturnDateInput = document.getElementById("expectedReturnDate");
    const totalPriceElement = document.getElementById("totalPrice");

    const rentalStartDate = new Date(rentalStartDateInput.value);
    const expectedReturnDate = new Date(expectedReturnDateInput.value);

    // Lấy giá thuê từ input ẩn
    const pricePerDay = parseFloat(document.querySelector('input[name="price"]').value);
    const priceInput = document.querySelector('input[name="price"]');

    // Kiểm tra nếu expectedReturnDate lớn hơn rentalStartDate
    if (expectedReturnDate <= rentalStartDate) {
        alert("Thời gian trả xe phải lớn hơn thời gian nhận xe.");
        return false;
    }

    // Tính số ngày thuê và tổng tiền
    const differenceInTime = expectedReturnDate - rentalStartDate;
    const differenceInDays = differenceInTime / (1000 * 3600 * 24); // Số ngày
    const totalPrice = differenceInDays * pricePerDay;

    // Cập nhật hiển thị tổng tiền
    totalPriceElement.textContent = 'Tổng tiền thuê: '+ totalPrice.toLocaleString('vi-VN') +' đ';

    return true; // Gửi form nếu hợp lệ
}

// Cập nhật tổng tiền khi ngày thay đổi
document.addEventListener("DOMContentLoaded", function() {
    const rentalStartDateInput = document.getElementById("rentalStartDate");
    const expectedReturnDateInput = document.getElementById("expectedReturnDate");

    // Kiểm tra nếu phần tử tồn tại
    if (rentalStartDateInput && expectedReturnDateInput) {
        rentalStartDateInput.addEventListener("change", validateAndCalculate);
        expectedReturnDateInput.addEventListener("change", validateAndCalculate);
    }
});

