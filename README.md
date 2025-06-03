# CopilotKit Travel Planner

An AI-powered travel planner built with CopilotKit, Next.js, and React.

## Features

- 🗺️ Interactive map integration with Google Maps
- 🤖 AI-powered trip planning assistance
- 📍 Smart place recommendations
- ⭐ Rating and review integration
- 📱 Responsive design for mobile and desktop
- 🎯 Real-time trip editing and management

## Tech Stack

- **Framework**: Next.js 14
- **UI**: React + Tailwind CSS + shadcn/ui
- **AI**: CopilotKit
- **Maps**: Google Maps API
- **Deployment**: Vercel

## Environment Variables

The following environment variables need to be set in your deployment:

```env
NEXT_PUBLIC_CPK_PUBLIC_API_KEY=your_copilotkit_api_key
OPENAI_API_KEY=your_openai_api_key
GOOGLE_MAPS_API_KEY=your_google_maps_api_key
```

## Development

```bash
npm install
npm run dev
```

## Deployment

Deploy to Vercel:

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/amo-tech-ai/travel-planner)

## License

MIT
