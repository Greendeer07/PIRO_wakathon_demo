# Python 3.11 슬림 버전 사용
FROM python:3.11-slim

# 파이썬 환경 변수 설정
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 작업 디렉토리 설정
WORKDIR /app

# 시스템 패키지 업데이트 및 의존성 설치 (중요 수정 부분)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       python3-dev \
       libpq-dev \
       build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# pip 업그레이드
RUN pip install --upgrade pip

# requirements.txt 복사 및 패키지 설치
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 프로젝트 코드 복사
COPY . /app/