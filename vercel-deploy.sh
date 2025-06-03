#!/bin/bash

# CopilotKit Travel Planner - Vercel Deployment Script
# This script handles the complete deployment process

set -e  # Exit on error

echo "🚀 CopilotKit Travel Planner - Vercel Deployment"
echo "================================================"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to check command success
check_success() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ $1${NC}"
    else
        echo -e "${RED}✗ $1 failed${NC}"
        exit 1
    fi
}

# Step 1: Verify we're in the correct directory
echo -e "${YELLOW}Step 1: Verifying project directory...${NC}"
if [ ! -f "package.json" ]; then
    echo -e "${RED}Error: Not in the correct directory. Please run from the ui folder.${NC}"
    exit 1
fi
check_success "Directory verification"

# Step 2: Check if already authenticated
echo -e "\n${YELLOW}Step 2: Checking Vercel authentication...${NC}"
if vercel whoami 2>/dev/null; then
    echo -e "${GREEN}Already authenticated with Vercel${NC}"
else
    echo -e "${YELLOW}Not authenticated. Attempting login...${NC}"
    
    # Check if VERCEL_TOKEN is set
    if [ ! -z "$VERCEL_TOKEN" ]; then
        echo "Using VERCEL_TOKEN from environment..."
        vercel --token "$VERCEL_TOKEN" whoami
        check_success "Token authentication"
    else
        echo "Please authenticate with Vercel:"
        echo "Run: vercel login"
        echo "Then run this script again."
        exit 1
    fi
fi

# Step 3: Pull latest project settings if they exist
echo -e "\n${YELLOW}Step 3: Pulling project settings...${NC}"
if [ -d ".vercel" ] && [ -f ".vercel/project.json" ]; then
    vercel pull --yes || true
    echo -e "${GREEN}✓ Project settings pulled${NC}"
else
    echo -e "${YELLOW}No existing project settings found. Will create new project.${NC}"
fi

# Step 4: Build the project locally first to ensure it works
echo -e "\n${YELLOW}Step 4: Building project locally...${NC}"
npm run build
check_success "Local build"

# Step 5: Deploy to Vercel
echo -e "\n${YELLOW}Step 5: Deploying to Vercel...${NC}"

# Check if we have a token for non-interactive deployment
if [ ! -z "$VERCEL_TOKEN" ]; then
    echo "Deploying with token..."
    vercel --prod --yes --token "$VERCEL_TOKEN"
else
    echo "Deploying interactively..."
    # First deploy to preview
    echo -e "${YELLOW}Deploying to preview environment...${NC}"
    DEPLOYMENT_URL=$(vercel --yes)
    check_success "Preview deployment"
    
    echo -e "\n${GREEN}Preview deployment successful!${NC}"
    echo -e "Preview URL: ${DEPLOYMENT_URL}"
    
    # Ask if user wants to promote to production
    echo -e "\n${YELLOW}Do you want to promote this to production? (y/n)${NC}"
    read -p ">" PROMOTE
    
    if [ "$PROMOTE" = "y" ] || [ "$PROMOTE" = "Y" ]; then
        echo -e "${YELLOW}Promoting to production...${NC}"
        vercel --prod --yes
        check_success "Production deployment"
    fi
fi

# Step 6: Display deployment information
echo -e "\n${GREEN}🎉 Deployment Complete!${NC}"
echo -e "================================="
echo -e "${GREEN}Your CopilotKit Travel Planner has been deployed successfully!${NC}"

# Get deployment URLs
echo -e "\n${YELLOW}Deployment URLs:${NC}"
vercel ls --limit 1

echo -e "\n${YELLOW}Next Steps:${NC}"
echo "1. Visit your deployment URL"
echo "2. Update environment variables in Vercel dashboard if needed"
echo "3. Configure custom domain (optional)"

echo -e "\n${GREEN}Happy travels with CopilotKit! 🚀${NC}"
