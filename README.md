# Docker container for Anafora

This project aims to simplify installation of [anafora](https://github.com/weitechen/anafora) (a web-based NLP annotation tool) by moving it inside a Docker container. The hardest part of using Anafora, in my experience, is installing it on the server, and getting the permissions correct with the data. This container simplifies the process by installing the server inside the container, and passing the data to the container as a mounted volume at launch time, where it has full permissions.

This is untested software and I make no claims as to its suitability for any purpose, but if you are willing to try it and feedback please create issues for any problems you have.

# To build
You will notice if you try to build as is:

```docker build -t anafora-container .```

you will get an error because of a missing anafora.htdigest file. You will have to create this file yourself, using the htdigest command:

```htdigest -c anafora.htdigest anafora <username>```

where username is the username you want, and enter a password for this user when prompted. This htdigest file will then be used by the container builder, and the login info you created is used to log in to the anafora web interface. The username will also be used to identify the annotator responsible for any changes, so if you have multiple annotators you should add them all to this file before building the container. If you will be doing any adjudication, you should create usernames as necessary for adjudicators, and edit the Dockerfile line 14 by adding all adjudicator usernames as anafora-admin in a space-separated list.

# To run
To run the container you should view the ```runContainer.sh``` file as an example. This assumes that you have named your container anafora-container as in the above build command, and that you have a directory inside your repo called ```data```. This data directory needs to contain a few elements, summarized here but better described in [anafora](https://github.com/weitechen/anafora) project documentation:

* .schema directory containing anafora annotation schema
* .setting.xml file that describes your projects and their schema
* Your data organized into sub-directories as:
```<project name>/<corpus name>/<document name>/<document name>```
where the document name must not have any file extension (even .txt), and yes, it is inside a directory named after itself. 
