import "@hotwired/turbo-rails"
import "./controllers"
import "trix"
import "@rails/actiontext"
import 'core-js/stable'; // pour polyfiller les anciennes APIs
import 'regenerator-runtime/runtime';

import AOS from "aos"
import "aos/dist/aos.css"
import confetti from "canvas-confetti"

document.addEventListener("turbo:load", () => {
  console.log("✅ turbo:load déclenché")

  AOS.init({ duration: 800, once: true })
  console.log("✅ AOS initialisé")

  const flash = document.querySelector(".flash-notice")
  const contactSection = document.getElementById("contact")

  // Scroll vers section contact même sans flash
  if (window.location.href.includes("#contact") && contactSection) {
    setTimeout(() => {
      contactSection.scrollIntoView({ behavior: "smooth" })
      console.log("📩 Scroll vers #contact (après délai)")
    }, 800)
  }

  // Confettis + disparition automatique du flash
  if (flash) {
    console.log("🎉 Flash notice détecté, lancement confettis")
    flash.scrollIntoView({ behavior: "smooth", block: "start" })

    confetti({
      particleCount: 150,
      spread: 70,
      origin: { y: 0.6 }
    })

    setTimeout(() => {
      flash.style.transition = "opacity 0.8s ease"
      flash.style.opacity = 0

      setTimeout(() => {
        flash.remove()
        console.log("✅ Flash notice supprimé")
      }, 800)
    }, 6000)
  }
})
