# Django with Docker

This quick-start guide demonstrates how to use Docker Compose to set up and run a simple Django/My-Sql app

## Define the project components
For this project, you need to create a <b>Dockerfile</b>, a Python dependencies file, and a <b>docker-compose.yml</b> file. (You can use either a <b>.yml</b> or <b>.yaml</b> extension for this file.)

1. Create an empty project directory.
    This directory is the <b>context</b> for your application image. The directory should only contain resources to build that image.
	
2. Create a new file called <b>Dockerfile</b> in your project directory.
    <br/>The <b>Dockerfile</b> defines an application’s image content via one or more build commands that configure that image. Once built, you can run the image in a container.
    <br/>For more information on Dockerfile, see:
    <br/><b>A.</b> https://docs.docker.com/get-started/
    <br/><b>B.</b> https://docs.docker.com/engine/reference/builder/

3. Create a <b>requirements.txt</b> in your project directory.
    <br/>This file is used by the <i>RUN pip install -r requirements.txt</i> command in your <b>Dockerfile</b>.

4. Create a file called <b>docker-compose.yml</b> in your project directory.
    <br/>The <b>docker-compose.yml</b> file describes the services that make your app. 
    <br/>In this example those services are a <b>web</b> server and <b>DB</b>. 
    <br/>The compose file also describes which Docker <b>images</b> these services use, how they link together, any volumes they might need to be mounted inside the containers. 
    <br/>Finally, the <b>docker-compose.yml</b> file describes which ports these services expose.

5. Create the Django project by running the docker-compose run command as follows.

     $sudo docker-compose run web django-admin startproject main .
	
    <br/>This instructs Compose to run django-admin startproject main in a container, using the web service’s image and configuration. 
    <br/>Because the web image doesn’t exist yet, Compose builds it from the current directory, as specified by the build: . line in docker-compose.yml.

    <br/>Once the web service image is built, Compose runs it and executes the django-admin startproject command in the container. 
    <br/>This command instructs Django to create a set of files and directories representing a Django project.

6. If you are running Docker on Linux, the files django-admin created are owned by root. This happens because the container runs as the root user. Change the ownership of the new files.

    <br/>Do not change the permission of the data folder where Postgres has its file, otherwise Postgres will not be able to start due to permission issues.

     $sudo chown -R $USER:$USER main manage.py
 
7. Run the docker-compose up command from the top level directory for your project.

     docker-compose up 

# Branch Info:
1. docker_django_CRUD_001: 
    <br/>To create application folder structure 
   <br/>$ sudo docker-compose run web django-admin startproject project .<br/>
   <br/>To reset permissions 
   <br/>$ sudo chown -R $USER:$USER project manage.py db.sqlite3
2. docker_django_CRUD_001.01
3. docker_django_CRUD_001.02
       <br/>links: https://mmorejon.io/en/blog/start-django-project-with-docker/
   <br/>https://stackoverflow.com/questions/56146169/django-startapp-workflow-with-docker
   <br/>Not working $ sudo docker-compose run web django-admin.py startapp employee
   <br/>$ sudo docker-compose run web python manage.py startapp employee
   <br/>$ sudo chown -R $USER:$USER employee
4. https://developer.ibm.com/tutorials/docker-dev-db/
5. https://runnable.com/docker/python/docker-compose-with-django-apps
6. https://www.dabbleofdevops.com/blog/setup-a-mysql-python-docker-dev-stack
7. https://blog.logrocket.com/dockerizing-django-app/
8. https://www.freecodecamp.org/news/end-to-end-api-testing-with-docker/
9. https://medium.com/@minghz42/docker-setup-for-django-on-mysql-1f063c9d16a0
10. 