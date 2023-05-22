module.exports = {
    content: [
      './src/**/*.{vue,js,ts,jsx,tsx,blade.php,html}',
    ],
    darkMode: 'class', // or 'media'
    theme: {
      extend: {},
    },
    variants: {
      extend: {},
    },
    plugins: [
      require('@tailwindcss/typography'),
      require('@tailwindcss/forms'),
      require('@tailwindcss/aspect-ratio'),
    ],
  }