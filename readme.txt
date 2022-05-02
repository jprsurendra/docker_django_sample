Links: https://docs.docker.com/samples/django/

Quickstart: Compose and Django

This quick-start guide demonstrates how to use Docker Compose to set up and run a simple Django/PostgreSQL app

Define the project components
-> For this project, you need to create a Dockerfile, a Python dependencies file, and a docker-compose.yml file. (You can use either a .yml or .yaml extension for this file.)

1. Create an empty project directory.
	This directory is the context for your application image. The directory should only contain resources to build that image.
	
2. Create a new file called Dockerfile in your project directory.
	The Dockerfile defines an application’s image content via one or more build commands that configure that image. Once built, you can run the image in a container.
	For more information on Dockerfile, see:
	https://docs.docker.com/get-started/
	https://docs.docker.com/engine/reference/builder/
3. Add the following content to the Dockerfile.

4. Create a requirements.txt in your project directory.
	This file is used by the RUN pip install -r requirements.txt command in your Dockerfile.

5. Create a file called docker-compose.yml in your project directory.
	The docker-compose.yml file describes the services that make your app. 
	In this example those services are a web server. 
	The compose file also describes which Docker images these services use, how they link together, any volumes they might need to be mounted inside the containers. 
	Finally, the docker-compose.yml file describes which ports these services expose. See the docker-compose.yml reference for more information on how this file works.

6. Create the Django project by running the docker-compose run command as follows.

 	$sudo docker-compose run web django-admin startproject main .
	
	This instructs Compose to run django-admin startproject main in a container, using the web service’s image and configuration. 
	Because the web image doesn’t exist yet, Compose builds it from the current directory, as specified by the build: . line in docker-compose.yml.

	Once the web service image is built, Compose runs it and executes the django-admin startproject command in the container. 
	This command instructs Django to create a set of files and directories representing a Django project.

7. If you are running Docker on Linux, the files django-admin created are owned by root. This happens because the container runs as the root user. Change the ownership of the new files.

	Do not change the permission of the data folder where Postgres has its file, otherwise Postgres will not be able to start due to permission issues.

 	$sudo chown -R $USER:$USER main manage.py
 
8. Run the docker-compose up command from the top level directory for your project.

 	docker-compose up 