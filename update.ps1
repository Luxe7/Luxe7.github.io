rmdir /s /q public
hugo
git add .
git commit -am "update"
git push origin main