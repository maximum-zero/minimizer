#!/bin/bash

# -----------------------------------------------------------
# Dev 환경 관리 스크립트
# 사용법: ./scripts/dev.sh [up|down]
# -----------------------------------------------------------

COMMAND=$1

# Docker Compose 파일과 환경 변수 파일 경로 설정
COMPOSE_FILE="config/docker-compose-dev.yml"
ENV_FILE="config/.env.dev"
PROJECT_NAME="minimizer-dev"

if [ "$COMMAND" = "up" ]; then
    echo "🚀 Dev 환경 컨테이너 빌드 및 실행 중..."
    docker-compose -p $PROJECT_NAME --env-file $ENV_FILE -f $COMPOSE_FILE up --build -d
    echo "✅ Dev 환경이 실행되었습니다."

elif [ "$COMMAND" = "down" ]; then
    echo "🗑️ Dev 환경 컨테이너 및 볼륨 제거 중..."
    docker-compose -p $PROJECT_NAME -f $COMPOSE_FILE down -v
    echo "✅ Dev 환경 컨테이너와 데이터가 정리되었습니다."

else
    echo "🚨 잘못된 명령어입니다. 사용법: ./scripts/dev.sh [up|down]"
    exit 1
fi
