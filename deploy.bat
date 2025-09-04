@echo off
echo ==============================
echo Spring Petclinic Deployment
echo ==============================

cd /d "%~dp0"

echo Stopping existing containers if any...
docker-compose down

echo Building and starting containers...
docker-compose up -d --build

echo ============================================================================
echo Running containers:
docker ps
echo ============================================================================

set /p tailchoice=Do you want to tail the Spring Petclinic logs now? (Y/N) : 
if /i "%tailchoice%"=="Y" (
    echo Tailing logs of the Spring Petclinic container...
    docker logs -f spring-petclinic
) else (
    echo Skipping log tailing.
)

echo ============================================================================
echo Spring Petclinic is now running.
echo Please open your browser and go to: http://localhost:8080
echo ============================================================================
pause
