# AI Career Copilot

AI Career Copilot is a production-grade ATS-style career platform inspired by tools like Jobscan and ResumeWorded. It helps users analyze resumes, close keyword gaps, build ATS-friendly resumes, generate resume content from chat, improve bullets, match jobs, and track resume versions over time.

## Features

- Resume Analyzer
  - Upload PDF/DOCX files
  - Extract resume text
  - Compare resume against a job description
  - Generate ATS score from 0-100
  - Structured scoring for keyword match, skills match, experience relevance, and formatting

- Resume Builder
  - Enter name, contact details, education, skills, projects, and experience
  - Multiple ATS-friendly templates: Classic ATS, Impact, Technical
  - Live resume preview
  - Save resume versions
  - Export through browser print-to-PDF

- AI Resume Generator
  - Chat-style interface for background input
  - Generates full resume content from plain language
  - Uses OpenAI when `OPENAI_API_KEY` is configured
  - Includes local fallback generation for offline development

- Resume Improvement Engine
  - Rewrites existing bullets
  - Adds stronger action verbs
  - Suggests quantified impact and ATS phrasing
  - Shows before vs after comparison

- Keyword Gap Analysis
  - Matched keywords
  - Missing keywords
  - Suggested keywords
  - Highlighted dashboard cards

- Smart Dashboard
  - Current ATS score
  - Section-wise score
  - Score history chart with Recharts
  - Saved versions and readiness status

- Job Matching System
  - Recommends best-fit roles
  - Shows fit score and targeted improvements

- Resume Version Control
  - Stores builder and generated resumes
  - Shows version history and score changes

- Authentication
  - JWT login/signup endpoints
  - MongoDB-backed user and history storage when configured

## Tech Stack

- Frontend: React, Vite, Tailwind CSS, Framer Motion, Axios, Recharts, Lucide React, React Dropzone
- Backend: Node.js, Express, Multer, Helmet, CORS, Rate Limiting
- Database: MongoDB with Mongoose
- AI: OpenAI API with local fallback services
- File Parsing: `pdf-parse` for PDF, `mammoth` for DOCX

## Screenshots

Add screenshots after running locally:

- `docs/screenshots/dashboard.png`
- `docs/screenshots/analyzer.png`
- `docs/screenshots/builder.png`
- `docs/screenshots/chatbot.png`

## Folder Structure

```text
/client
  /src
    /api
    /components
    /features
      /analyzer
      /builder
      /chatbot
      /dashboard
      /jobs
    /pages
/server
  /controllers
  /middleware
  /models
  /routes
  /services
  /utils
```

## Setup

### 1. Install dependencies

```bash
npm install
npm run install:all
```

On Windows PowerShell, use:

```bash
npm.cmd install
npm.cmd run install:all
```

### 2. Environment variables

Create `server/.env` from `server/.env.example`:

```bash
PORT=5000
CLIENT_URL=http://localhost:5173
MONGO_URI=mongodb://127.0.0.1:27017/resume-analyzer
JWT_SECRET=replace-with-a-long-random-secret
OPENAI_API_KEY=
OPENAI_MODEL=gpt-4o-mini
```

Create `client/.env` from `client/.env.example`:

```bash
VITE_API_URL=http://localhost:5000/api
```

MongoDB is optional for core analyzer, builder, chat, and job matching flows. Without MongoDB, history and versions are held in memory for the running server. Authentication requires both MongoDB and `JWT_SECRET`.

### 3. Run locally

```bash
npm run dev
```

Or double-click:

```text
run-app.bat
```

Frontend:

```text
http://localhost:5173
```

Backend health check:

```text
http://localhost:5000/health
```

## API Endpoints

### `POST /api/upload-resume`

Multipart form-data:

- `resume`: PDF or DOCX file

### `POST /api/analyze`

```json
{
  "resumeText": "Resume text",
  "jobDescription": "Job description",
  "resumeName": "resume.pdf"
}
```

Scoring weights:

- Keyword Match: 35%
- Skills Match: 25%
- Experience: 20%
- Formatting: 20%

### `POST /api/generate-resume`

```json
{
  "profile": "I am a 3rd year CSE student and built two React projects...",
  "jobDescription": "Target role description",
  "tone": "professional"
}
```

### `POST /api/build-resume`

```json
{
  "name": "Candidate Name",
  "skills": "React, Node.js, MongoDB",
  "experience": "Built APIs and dashboards",
  "education": "B.Tech CSE",
  "templateId": "classic"
}
```

### `POST /api/improve-resume`

```json
{
  "resumeText": "Resume text",
  "jobDescription": "Job description"
}
```

### `POST /api/chat-resume`

```json
{
  "message": "I am a 3rd year CSE student, built 2 projects...",
  "history": [],
  "jobDescription": "Target job description"
}
```

### `POST /api/match-jobs`

```json
{
  "resumeText": "Resume text",
  "jobDescription": "Optional job description"
}
```

### `GET /api/history`

Returns recent ATS analyses.

### `GET /api/versions`

Returns saved builder and generated resume versions.

### `GET /api/templates`

Returns available ATS resume templates.

## AI Prompts

Prompt templates live in:

```text
server/services/promptService.js
```

They cover:

- Resume generation
- Resume chatbot behavior
- ATS keyword and impact-oriented phrasing

## Deployment

- Backend: Render, Railway, Fly.io, or a Node-compatible VPS
- Frontend: Vercel, Netlify, or static hosting
- Database: MongoDB Atlas
- Set backend `CLIENT_URL` to your deployed frontend origin
- Set frontend `VITE_API_URL` to your deployed backend `/api` URL
- Keep `OPENAI_API_KEY` only on the backend

## Live Demo

Live demo link: add deployed URL here.
