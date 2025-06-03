/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  
  // Disable ESLint during builds to avoid errors
  eslint: {
    ignoreDuringBuilds: true,
  },
  
  // Image optimization settings
  images: {
    domains: ['images.unsplash.com', 'unpkg.com', 'via.placeholder.com'],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**',
      },
    ],
  },
  
  // Environment variables
  env: {
    NEXT_PUBLIC_CPK_PUBLIC_API_KEY: process.env.NEXT_PUBLIC_CPK_PUBLIC_API_KEY,
    OPENAI_API_KEY: process.env.OPENAI_API_KEY,
    GOOGLE_MAPS_API_KEY: process.env.GOOGLE_MAPS_API_KEY,
    NEXT_PUBLIC_APP_URL: process.env.NEXT_PUBLIC_APP_URL || process.env.VERCEL_URL || 'http://localhost:3000',
  },
  
  // Ensure CopilotKit packages are transpiled
  transpilePackages: [
    '@copilotkit/react-core', 
    '@copilotkit/react-ui',
    '@copilotkit/runtime',
    '@copilotkit/runtime-client-gql'
  ],  
  // Webpack configuration for better optimization
  webpack: (config, { isServer }) => {
    if (!isServer) {
      config.resolve.fallback = {
        ...config.resolve.fallback,
        fs: false,
        net: false,
        tls: false,
      };
    }
    return config;
  },
  
  // Experimental features
  experimental: {
    optimizePackageImports: ['@copilotkit/react-core', '@copilotkit/react-ui'],
  },
};

export default nextConfig;