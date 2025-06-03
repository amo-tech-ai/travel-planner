# CopilotKit Travel Planner - Deployment Troubleshooting Guide

## ✅ Quick Fixes for Common Issues

### 1. Build Failures on Vercel

**Symptoms:** Build fails with dependency or environment variable errors

**Solutions:**
```bash
# Clear cache and reinstall
rm -rf node_modules package-lock.json .next
npm install
npm run build
```

### 2. Environment Variables Not Working

**Symptoms:** App loads but APIs don't work

**Solutions:**
- Check Vercel Dashboard → Project → Settings → Environment Variables
- Ensure variables start with `NEXT_PUBLIC_` for client-side access
- Redeploy after adding environment variables

### 3. CSS Not Loading Properly

**Symptoms:** Styles are broken or missing

**Solutions:**
- Verify `postcss.config.mjs` includes autoprefixer
- Check `tailwind.config.ts` configuration
- Ensure CSS imports are in the correct order

### 4. Google Maps Not Working

**Symptoms:** Map doesn't load or shows errors

**Solutions:**
- Enable Maps JavaScript API in Google Cloud Console
- Add your domain to API key restrictions
- Check browser console for specific error messages

### 5. CopilotKit Connection Issues

**Symptoms:** Chat interface doesn't work

**Solutions:**
- Verify CopilotKit API key is valid
- Check if your plan has sufficient usage limits
- Test with a simple CopilotKit example first

## 🛠️ Debugging Commands

```bash
# Check build locally
npm run build

# Check environment variables
npm run dev
# Then open browser console and check process.env

# Test API connections
curl -H "Authorization: Bearer YOUR_OPENAI_KEY" https://api.openai.com/v1/models

# Check Vercel deployment logs
vercel logs [deployment-url]
```

## 📚 Useful Resources

- [CopilotKit Documentation](https://docs.copilotkit.ai)
- [Vercel Deployment Guide](https://vercel.com/docs/deployments)
- [Next.js Configuration](https://nextjs.org/docs/api-reference/next.config.js/introduction)
