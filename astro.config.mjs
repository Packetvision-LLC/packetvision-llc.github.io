// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';

// https://astro.build/config
export default defineConfig({
  site: 'https://packetvision-llc.github.io',
  vite: {
    plugins: [tailwindcss()]
  },
  base: '/',
  output: 'static',
  build: {
    assets: 'assets'
  }
});
