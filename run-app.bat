@echo off
title AI Resume Analyzer
cd /d "%~dp0"

echo Starting AI Resume Analyzer...
echo.
echo Frontend: http://localhost:5173
echo Backend:  http://localhost:5000/health
echo.

start "" "http://localhost:5173"
npm.cmd run dev

pause
