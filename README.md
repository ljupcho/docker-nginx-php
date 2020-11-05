Create new folder and in it:
- clone your app with name `web` or change this .env file with the right name for APP_CODE_WEB_PATH_HOST. <br/>
- clone this repository <br/>
- copy your `id_rsa` and `id_rsa.pub` ssh keys to the folder php-fpm/ssh/ in case your application requires other packages from your git <br/>
- run `./startup.sh` to build up docker images and prepare the app with installed `be` & `fe` packages<br/><br/>
After approximately 10 min you can access the application via browser `http://localhost:8081`<br/><br/>
You may go through the .env parameters of this docker app and change to your preference, at the moment this will run on php7.4 and will also run for the consumers that will be kept alive using supervisor for your laravel queues. <br/></br>
Also if any changes are done to the Dockerfile you will need to run: `docker-compose up -d --build` <br/><br/>
You can run `docker ps` to check the running containers with exported ports to your localhost machine. <br/><br/>
To clean everything you can run `docker system prune -a` </br>


## Setting up PHPStorem with xDebug
1). Go to File -> Settings -> Languages & Frameworks -> PHP -> Debug and set the debug port to 9005 <br/>
2). Go to File -> Settings -> Languages & Frameworks -> PHP -> Servers and add a new server with name `rb-local`, host `localhost`, port `8081`, check the use path mappings and map your local application folder path to `/var/www/web` <br/>
3). Go to File -> Settings -> Build, Execution, Deployment -> Docker and add new with name `Docker-RB` and choose Unix socket, connection should be successful <br/>
4). Go to File -> Settings -> Languages & Frameworks -> PHP and click on the CLI Interpreter three dots, add new and choose Docker, choose `Docker-RB` for server, for configuration files choose the docker-compose.yml file, choose `web` for Service. Under General you should have php 7.4.0 as version
5). In phpstorm's toolbar, click Edit Configuration, click add new and choose `PHP Remote Debug`. Give it a name `rb-local` and choose the server `rb-local` created from step 2, for IDE key type `PHPSTORM` <br/>
6). Click on the `debug` icon in the ide toolbar, add some breakpoints and refresh your browser, you should get detailed info in phpstorm. You can verify that phpstorm is listening for incoming connectins with `netstat -tpln` and find local address with :::9005 port <br/>








