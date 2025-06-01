// @ts-check
import { defineConfig } from 'astro/config';

import node from '@astrojs/node';

import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  // SSR configuration for dynamic routing
  output: 'server',
  adapter: node({
    mode: 'standalone'
  }),
  // Server configuration
  server: {
    host: '0.0.0.0',
    port: 3000,
    // Allow external hosts (for Cloudflare tunnel)
    allowedHosts: ['hackathon.b28.dev', 'localhost']
  },

  // Development configuration
  vite: {
    plugins: [tailwindcss()],
    server: {
      watch: {
        usePolling: true // Better for Docker hot reload
      }
    },
    // Define API routes that should be proxied in development
    define: {
      __API_URL__: JSON.stringify(process.env.NODE_ENV === 'production' 
        ? '/api' 
        : 'http://localhost:8000'
      )
    }
  },

  // Route configuration - let Astro handle all routes except /api
  routing: {
    // Astro will handle all routes, Traefik will intercept /api before it gets here
    strategy: 'auto'
  }
});
