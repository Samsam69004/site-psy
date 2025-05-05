// tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/javascripts/**/*.js",
    "./app/assets/stylesheets/**/*.{css,scss}"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Lora', 'serif'],             // => classe Tailwind : font-sans
        serif: ['"Playfair Display"', 'serif'] // => classe Tailwind : font-serif
      },
      colors: {
        green: {
          600: "#166534", // vert foncé
        },
      },
    },
  },
  plugins: [],
};
