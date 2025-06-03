# CopilotKit Travel Planner - Vercel Deployment Guide

## 🚀 Quick Deployment Steps

Since Vercel requires interactive authentication, here's the complete process:

### Step 1: Authenticate with Vercel (One-time setup)

Open a terminal and run:
```bash
cd /home/sk/projects/CopilotKit/examples/coagents-travel/ui
vercel login
```

Choose your preferred authentication method:
- **GitHub** (recommended)
- GitLab
- Bitbucket
- Email

### Step 2: Deploy to Production

Once authenticated, run:
```bash
vercel --prod --yes
```

### Alternative: Token-based Deployment

If you have a Vercel token, you can deploy without interactive login:

1. Get your token from: https://vercel.com/account/tokens
2. Export it: `export VERCEL_TOKEN="your-token-here"`
3. Deploy: `vercel --prod --yes --token $VERCEL_TOKEN`

## 📋 Pre-deployment Checklist

✅ All dependencies installed
✅ Environment variables configured in `.env.local`
✅ Build tested locally (`npm run build`)
✅ Vercel CLI installed (`vercel --version`)

## 🔧 Environment Variables to Set in Vercel Dashboard

After deployment, go to your Vercel dashboard and set:

- `NEXT_PUBLIC_CPK_PUBLIC_API_KEY` - Your CopilotKit API key
- `OPENAI_API_KEY` - Your OpenAI API key
- `GOOGLE_MAPS_API_KEY` - Your Google Maps API key

## 🎯 Expected Result

After successful deployment, you'll get:
- Production URL: `https://your-project.vercel.app`
- Preview URLs for each commit
- Automatic SSL certificate
- Global CDN distribution

## 🚨 Troubleshooting

If you encounter issues:
1. Ensure you're in the correct directory
2. Check that all environment variables are set
3. Verify the build works locally first
4. Check Vercel dashboard for deployment logs
