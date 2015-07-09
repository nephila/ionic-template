echo -e "\x1B[1;97;44mCreating $1 project...\x1B[0m"
ionic start $1 $2
cd $1
echo -e "\x1B[1;97;44mDone.\x1B[0m"
echo ""
echo -e "\x1B[1;97;44mPreparing Android stuff...\x1B[0m"
ionic platform add android
echo -e "\x1B[1;97;44mDone.\x1B[0m"
echo ""
echo -e "\x1B[1;97;44mPreparing React.js stuff...\x1B[0m"
mkdir jsx
npm install --save-dev gulp-react
echo -e "\x1B[1;97;44mDone.\x1B[0m"
echo ""
echo -e "\x1B[1;97;44mPreparing custom styles...\x1B[0m"
touch scss/style.scss
echo -e "\x1B[1;97;44mDone.\x1B[0m"
echo ""
echo -e "\x1B[1;97;44mPreparing gulpfile.js...\x1B[0m"
wget -N https://raw.githubusercontent.com/nephila/ionic-template/master/.jshintrc
wget -N https://raw.githubusercontent.com/nephila/ionic-template/master/.scss-lint.yml
wget -N https://raw.githubusercontent.com/nephila/ionic-template/master/gulpfile.js
echo -e "\x1B[1;97;44mDone.\x1B[0m"
echo ""
echo -e "\x1B[1;97;44mPreparing libraries...\x1B[0m"
bower install
bower install --save react
npm install
npm install gulp-scss-lint --save-dev
npm install gulp-jshint --save-dev
echo -e "\x1B[1;97;44mDone.\x1B[0m"
echo ""
echo -e "\x1B[1;97;44mCompiling...\x1B[0m"
gulp
echo -e "\x1B[1;97;44mDone.\x1B[0m"
