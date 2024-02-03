import { defineConfig } from 'vite';

export default defineConfig({
    server: {
        open: '/index.html',
        port: 3000,
    },
    preview: {
        open: '/index.html',
        port: 3000,
    },
    publicDir: 'src',
    root: 'src',
    appType: 'mpa',
    build: {
        target: 'esnext',
        minify: 'terser',
        assetsDir: 'assets',
        outDir: '../dist',
        cssMinify: 'lightningcss',
        emptyOutDir: true,
        manifest: true
    },
});