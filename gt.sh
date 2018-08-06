#!/bin/bash

git pull
git add .
git commit -m $(date +%D)
git push

