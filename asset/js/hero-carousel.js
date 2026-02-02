// Hero image carousel
const heroCarousel = {
  images: [
    '/assets/img/hero/hero-01.jpg',
    '/assets/img/hero/hero-02.jpg',
    '/assets/img/hero/hero-03.jpg'
  ],
  currentIndex: 0,
  intervalId: null,
  intervalDuration: 6000, // 6 seconds

  init() {
    console.log('Carousel init called');

    // Only initialize if we have multiple images
    if (this.images.length < 2) {
      console.log('Only one image, hiding controls');
      // Set single image and return
      this.updateBackground();
      // Hide carousel controls
      const arrows = document.querySelectorAll('.hero-carousel-arrow');
      const indicators = document.querySelector('.hero-carousel-indicators');
      arrows.forEach(arrow => arrow.style.display = 'none');
      if (indicators) indicators.style.display = 'none';
      return;
    }

    console.log('Multiple images detected, setting up carousel');

    // Set initial image
    this.updateBackground();

    // Start auto-rotation
    this.startAutoRotate();

    // Add event listeners for controls
    this.setupControls();

    console.log('Carousel initialized successfully');
  },

  updateBackground() {
    const heroBanner = document.querySelector('.hero-banner');
    if (!heroBanner) {
      console.error('Hero banner not found in updateBackground');
      return;
    }

    const imageUrl = this.images[this.currentIndex];
    console.log('Setting background to:', imageUrl);

    // Update background image while keeping gradient
    const lightGradient = 'linear-gradient(135deg, rgba(13, 46, 43, 0.85) 0%, rgba(5, 17, 34, 0.90) 100%)';
    const darkGradient = 'linear-gradient(135deg, rgba(13, 46, 43, 0.90) 0%, rgba(5, 17, 34, 0.95) 100%)';

    const isDark = document.body.classList.contains('quarto-dark');
    const gradient = isDark ? darkGradient : lightGradient;

    heroBanner.style.backgroundImage = `${gradient}, url('${imageUrl}')`;
    console.log('Background image set');

    // Update indicators
    this.updateIndicators();
  },

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.images.length;
    this.updateBackground();
    this.resetAutoRotate();
  },

  prev() {
    this.currentIndex = (this.currentIndex - 1 + this.images.length) % this.images.length;
    this.updateBackground();
    this.resetAutoRotate();
  },

  goTo(index) {
    this.currentIndex = index;
    this.updateBackground();
    this.resetAutoRotate();
  },

  startAutoRotate() {
    this.intervalId = setInterval(() => this.next(), this.intervalDuration);
  },

  stopAutoRotate() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = null;
    }
  },

  resetAutoRotate() {
    this.stopAutoRotate();
    this.startAutoRotate();
  },

  setupControls() {
    // Arrow buttons
    const leftArrow = document.querySelector('.hero-carousel-arrow-left');
    const rightArrow = document.querySelector('.hero-carousel-arrow-right');

    if (leftArrow) {
      leftArrow.addEventListener('click', () => this.prev());
    }
    if (rightArrow) {
      rightArrow.addEventListener('click', () => this.next());
    }

    // Indicators
    document.querySelectorAll('.hero-carousel-indicator').forEach((indicator, index) => {
      indicator.addEventListener('click', () => this.goTo(index));
    });
  },

  updateIndicators() {
    document.querySelectorAll('.hero-carousel-indicator').forEach((indicator, index) => {
      if (index === this.currentIndex) {
        indicator.classList.add('active');
      } else {
        indicator.classList.remove('active');
      }
    });
  }
};

// Initialize carousel when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  console.log('Hero carousel: DOM loaded');
  const heroBanner = document.querySelector('.hero-banner');
  console.log('Hero banner element:', heroBanner);

  if (heroBanner) {
    console.log('Initializing carousel with', heroCarousel.images.length, 'images');
    heroCarousel.init();
  } else {
    console.error('Hero banner element not found');
  }
});
