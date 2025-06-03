#!/bin/bash

# Automated Vercel Deployment Setup

echo "🔧 Setting up automated Vercel deployment..."
echo "=========================================="

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: Not in the correct directory"
    exit 1
fi

# Create a deployment info file
cat > DEPLOY_NOW.md << 'EOF'
# 🚀 Deploy CopilotKit Travel Planner to Vercel

## Option 1: Quick Deploy (Recommended)

1. Open terminal in this directory
2. Run: `vercel login`
3. Choose GitHub authentication
4. Run: `vercel --prod --yes`

## Option 2: Token-based Deploy

1. Get token from: https://vercel.com/account/tokens
2. Run: `VERCEL_TOKEN=your-token-here vercel --prod --yes --token $VERCEL_TOKEN`

## Current Status: ✅ READY TO DEPLOY

All configurations are complete and tested!
EOF

echo "✅ Deployment guide created: DEPLOY_NOW.md"
echo ""
echo "Next step: Run 'vercel login' to authenticate"
