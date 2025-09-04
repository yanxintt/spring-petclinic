@echo off
echo ==============================
echo Stop Spring Petclinic Deployment
echo ==============================

cd /d "%~dp0"

REM Stop all containers
echo Stopping containers...
docker-compose down

REM Remove specific image (optional)
echo Removing Spring Petclinic image...
docker rmi spring-petclinic:latest

REM Remove dangling images
echo Removing dangling images...
docker image prune -f

REM Remove unused volumes
echo Removing unused volumes...
docker volume prune -f

REM Show current containers
echo Current running containers:
docker ps

echo Deployment stopped and resources cleaned.
pause
