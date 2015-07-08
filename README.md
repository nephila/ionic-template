# Ionic template

## Setup

Install Ionic Framework (you must be superuser)

    $ npm install -g bower cordova ionic

Install the script on your machine

    $ wget https://raw.githubusercontent.com/nephila/ionic-template/master/nephilaionic.sh && chmod a+x nephilaionic.sh

If you experience some problems with node on Ubuntu please follow this link http://stackoverflow.com/questions/18130164/nodejs-vs-node-on-ubuntu-12-04

Then run it specifying the name of your project and the type (tabs, blank)

    $ ./nephilaionic.sh myApp [blank|tabs|sidemenu]

Now you can start working on your app

    $ cd myApp
    $ ionic serve

## License

MIT @ Nephila