#!/usr/bin/env sh


npm run build

git add .

git commit -m 'deploy'

git push
