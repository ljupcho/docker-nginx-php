Create new folder and in it:
- clone your app with name web or change this .env file with the right name for APP_CODE_WEB_PATH_HOST <br/>
- clone this repository <br/>
- run ./startup.sh to build up docker images and prepare the app with installed packages from your composer.json file <br/>
- copy your id_rsa and id_rsa.pub ssh keys to the folder php-fpm/ssh/ if your application requires other packages from your git <br/>
<br/>
You may go through the .env parameters of this docker app and change to your preference, at the moment this will run on php7.4 and will also run for the consumers that will be kept alive using supervisor for your laravel queues. <br/>




