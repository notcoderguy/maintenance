import { defineConfig } from 'vite';
import { ViteMinifyPlugin } from 'vite-plugin-minify'

export default defineConfig({
    plugins: [
        ViteMinifyPlugin({}),
    ],
    server: {
        open: '/index.html',
    },
    preview: {
        open: '/index.html',
    },
    base: '',
    appType: 'mpa',
    input: ['resources/css/app.css', 'resources/js/app.js'],
    refresh: true,
    root: 'src',
    build: {
        assetsDir: 'assets',
        outDir: '../dist',
        emptyOutDir: true,
    },
});