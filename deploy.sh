#!/bin/bash

# CopilotKit Travel Planner Deployment Script
# This script handles common deployment issues and ensures proper setup

echo "🚀 Starting CopilotKit Travel Planner deployment..."

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Make sure you're in the ui directory."
    exit 1
fi

# Step 1: Clean install dependencies
echo "📦 Installing dependencies..."
rm -rf node_modules package-lock.json
npm install

# Step 2: Check environment variables
echo "🔍 Checking environment variables..."
if [ ! -f ".env.local" ]; then
    echo "⚠️  Warning: .env.local not found. Creating template..."
    cat > .env.local << EOF
# Replace these with your actual API keys
NEXT_PUBLIC_CPK_PUBLIC_API_KEY=your-copilotkit-public-key
OPENAI_API_KEY=sk-your-openai-key
GOOGLE_MAPS_API_KEY=AIza-your-google-maps-key
NEXT_PUBLIC_APP_URL=http://localhost:3000
EOF
    echo "📝 Please update .env.local with your actual API keys before deployment"
fi

# Step 3: Run build test locally
echo "🔨 Testing build locally..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Local build successful!"
else
    echo "❌ Local build failed. Please fix the errors before deploying."
    exit 1
fi

# Step 4: Deploy to Vercel
echo "☁️  Deploying to Vercel..."
if command -v vercel &> /dev/null; then
    vercel --prod
else
    echo "⚠️  Vercel CLI not found. Installing..."
    npm install -g vercel
    vercel --prod
fi

echo "🎉 Deployment completed!"
echo "📋 Next steps:"
echo "1. Set environment variables in Vercel Dashboard"
echo "2. Verify the deployment works correctly"
echo "3. Check logs for any runtime errors"
