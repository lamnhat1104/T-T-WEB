const productImage = document.querySelector('.product-image');
const imgs = document.querySelectorAll('img.Wave-RSX-img');
const btnLeft = document.querySelector('.btn-left');
const btnRight = document.querySelector('.btn-right');
const length = imgs.length;
let current = 0;

// Function to update the active slide and indicator
const updateSlide = () => {
    const width = imgs[0].offsetWidth;
    productImage.style.transform = `translateX(${-width * current}px)`;
    document.querySelector('.active').classList.remove('active');
    document.querySelector(`.index-item-${current}`).classList.add('active');
};

// Function to handle slide changes automatically
const handleChangesSlide = () => {
    current = (current + 1) % length; // Increment current and loop back to 0
    updateSlide();
};

// Initialize the automatic slide change interval
let handleEventChangeSlide = setInterval(handleChangesSlide, 4000);

// Event listener for the right button (next slide)
btnRight.addEventListener('click', () => {
    clearInterval(handleEventChangeSlide); // Reset interval
    handleChangesSlide();
    handleEventChangeSlide = setInterval(handleChangesSlide, 4000);
});

// Event listener for the left button (previous slide)
btnLeft.addEventListener('click', () => {
    clearInterval(handleEventChangeSlide); // Reset interval
    current = (current === 0) ? length - 1 : current - 1; // Decrement current or loop to last
    updateSlide();
    handleEventChangeSlide = setInterval(handleChangesSlide, 4000);
});