#! /bin/bash

# Stop on errors
set -e

# 1. Build site
hugo --gc --minify
