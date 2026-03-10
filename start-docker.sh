#!/bin/bash
cd src

if [ -d "ai-chungkhoan" ]; then
    echo "Updating ai-chungkhoan..."
    cd ai-chungkhoan && git pull && cd ..
else
    echo "Cloning ai-chungkhoan..."
    git clone git@github.com:zuongthaotn/ai-chungkhoan.git
fi
#
if [ -d "phantich-chungkhoan" ]; then
    echo "Updating phantich-chungkhoan..."
    cd phantich-chungkhoan && git pull && cd ..
else
    echo "Cloning phantich-chungkhoan..."
    git clone git@github.com:zuongthaotn/phantich-chungkhoan.git
fi
#
if [ -d "vn-stock-data" ]; then
    echo "Updating vn-stock-data..."
    cd vn-stock-data && git pull && cd ..
else
    echo "Cloning vn-stock-data..."
    git clone git@github.com:tempusoneps/vn-stock-data.git
fi
#
cd ..

if [ -z "$(docker images -q algo_analytics:v1.0 2> /dev/null)" ]; then
    echo "Image algo_analytics:v1.0 does not exist. Building without cache..."
    docker compose build --no-cache
    docker compose up -d
else
    echo "Image algo_analytics:v1.0 exists. Starting containers..."
    docker compose up -d
fi