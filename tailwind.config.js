/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.{html,erb}",
    "./app/javascript/**/*.{js,ts}",
    "./app/helpers/**/*.rb"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Lora', 'serif'],
        serif: ['"Playfair Display"', 'serif']
      },
      colors: {
        green: {
          600: "#166534"
        }
      }
    }
  },
  plugins: [require("tailwindcss-animate")]
}
