Remove-Item -Path ".\public" -Force -Recurse
hugo
git add .
git commit -am "update"
git push origin main