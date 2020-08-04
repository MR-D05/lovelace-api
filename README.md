# lovelace-api

The intention behind this project is to provide a minimalist framework for building speedy web APIs and app backends. Named "lovelace-api" as it is written in Ada! 

## Development server

The project provides a Dockerfile to get anyone up and running. A few addendums are outlined below and include setting up a PostgreSQL database.

You may need to adjust the following directions to suite your particular OS. I am using:

-Docker Desktop Community Version 2.0.0.0-mac81 (29211)

You will need to navigate to the root of the project directory and run:

```
docker build .
```

After the image has been built you can run the following to pull up a shell in the container:

```
docker run -it <ImageId> bash
```

Fire up nginx and postgresql with:

```
service nginx start && service postgresql start
```

## Initialize PostgreSQL

I do not in general recommend the following practice, but for the purposes of this demonstration, go ahead and connect to the psql command line and create a user "root" with corresponding table.
Run `sudo -u postgres psql` to open a shell, and then `CREATE ROLE root WITH SUPERUSER CREATEDB CREATEROLE LOGIN ENCRYPTED PASSWORD 'root';` followed by `CREATE DATABASE root;`

Exit out of the shell and navigate to the docs directory within the root of the lovelace-api project and run:

```
psql < tables.sql
```

Open another shell `psql`, connect to db `\c root`, and copy and paste inside the shell the contents of dummy_data.txt found inside the docs directory.

Last thing: we need to build our ORM db files. Do this by running the following within the src directory:

```
gnatcoll_postgres2ada -dbname=root -dbuser=root dbmodel=dbschema.txt
```

## Build

Before we build the project, navigate to `/root/lib/bcrypt` and run `make all`

Now, we'll make use of our Makefile in the root of the project to build the project itself. 

Run:

```
make run
```

## Running tests

The test we'll be running is a simple user authentication request that might be made from a frontend application. We'll see a JSON request with a username and password. Hopefully, our API will process this request and return an authentication token! 

With the project up and running open up another shell by running:

```
docker exec -it <ContainerId> bash
```

Now, navigate to the scripts directory and run:

```
./post.rb post.json
```

You should see some logging output in the first shell, and a valid response with complete with authentication token in the shell from which you issued the curl request!

## Going further

Right now this project is pretty basic, but it has a strong foundation. Feel free to clone the project and build it out anyway you see fit!
