#!/bin/bash

# Set environment variables for Vercel deployment
echo "Setting environment variables in Vercel..."

# Set the environment variables using Vercel CLI
vercel env add NEXT_PUBLIC_CPK_PUBLIC_API_KEY production --token nFVna8lrHUIs9GVNsdqkcFrn <<< "cpk_test_key_placeholder"
vercel env add OPENAI_API_KEY production --token nFVna8lrHUIs9GVNsdqkcFrn <<< "sk-test_key_placeholder"  
vercel env add GOOGLE_MAPS_API_KEY production --token nFVna8lrHUIs9GVNsdqkcFrn <<< "AIza_test_key_placeholder"

echo "Environment variables set. Redeploying..."

# Redeploy
vercel --prod --yes --token nFVna8lrHUIs9GVNsdqkcFrn
