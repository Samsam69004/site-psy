import "@hotwired/turbo-rails"
import "./controllers"
import "trix"
import "@rails/actiontext"
import "core-js/stable" // polyfills anciens navigateurs
import "regenerator-runtime/runtime"

document.addEventListener("turbo:load", async () => {
  console.log("✅ turbo:load déclenché")

  // Dynamically load AOS
  const AOS = (await import("aos")).default
  await import("aos/dist/aos.css")
  AOS.init({ duration: 800, once: true })
  console.log("✅ AOS initialisé")

  const flash = document.querySelector(".flash-notice")
  const contactSection = document.getElementById("contact")

  // Scroll vers section #contact si ancre dans l'URL
  if (window.location.href.includes("#contact") && contactSection) {
    setTimeout(() => {
      contactSection.scrollIntoView({ behavior: "smooth" })
      console.log("📩 Scroll vers #contact (après délai)")
    }, 800)
  }

  // Si flash présent, on déclenche les confettis
  if (flash) {
    console.log("🎉 Flash notice détecté, lancement confettis")
    flash.scrollIntoView({ behavior: "smooth", block: "start" })

    const confetti = (await import("canvas-confetti")).default
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
