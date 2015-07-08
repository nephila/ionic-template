#ionic start $1
cd $1
echo -e "\x1B[44mPreparing Android stuff...\x1B[0m"
ionic platform add android
echo -e "\x1B[44mDone.\x1B[0m"
echo ""
echo -e "\x1B[44mPreparing React.js stuff...\x1B[0m"
mkdir jsx
npm install --save-dev gulp-react
echo -e "\x1B[44mDone.\x1B[0m"
echo ""
echo -e "\x1B[44mPreparing custom styles...\x1B[0m"
touch scss/style.scss
echo -e "\x1B[44mDone.\x1B[0m"
echo ""
echo -e "\x1B[44mPreparing gulpfile.js...\x1B[0m"
wget -N https://raw.githubusercontent.com/nephila/ionic-template/master/gulpfile.js
echo -e "\x1B[44mDone.\x1B[0m"
