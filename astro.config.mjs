// @ts-check
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

// https://astro.build/config
export default defineConfig({
  site: 'https://packetvision-llc.github.io',
  integrations: [tailwind()],
  base: '/',
  output: 'static',
  build: {
    assets: 'assets'
  }
});
