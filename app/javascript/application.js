// app/javascript/application.js
import "../assets/stylesheets/application.tailwind.css"

// Import des modules Rails / Stimulus
import "@hotwired/turbo-rails"
import "./controllers"

// ✅ AOS animé automatiquement
import AOS from "aos"
import "aos/dist/aos.css"

document.addEventListener("DOMContentLoaded", () => {
  // Initialisation d’AOS
  AOS.init({
    duration: 800,
    once: true
  });

  // Message flash qui disparaît
  const confirmation = document.getElementById("confirmationMessage")
  if (confirmation) {
    setTimeout(() => {
      confirmation.style.transition = "opacity 0.5s ease"
      confirmation.style.opacity = 0
    }, 5000)
  }
})
