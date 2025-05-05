import { Application } from "@hotwired/stimulus"
import AOS from 'aos'
import 'aos/dist/aos.css'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }



document.addEventListener("DOMContentLoaded", () => {
  AOS.init({
    duration: 1000,
    once: true
  });
});
