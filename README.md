# Docker container for Anafora

This project aims to simplify installation of [https://github.com/weitechen/anafora anafora] (a web-based NLP annotation tool) by moving it inside a Docker container. The hardest part of using Anafora, in my experience, is installing it on the server, and getting the permissions correct with the data. This container simplifies the process by installing the server inside the container, and passing the data to the container as a mounted volume at launch time, where it has full permissions.

This is untested software and I make no claims as to its suitability for any purpose, but if you are willing to try it and feedback please create issues for any problems you have.

# To use
You will notice if you try to build as is you will get an error because of a missing anafora.htdigest file. You will have to create this file yourself, using the command like:
```htdigest -c anafora.htdigest anafora <username>```
where username is the username you want, and enter a password for this user when prompted. This htdigest file will then be used by the container builder, and the login info you created is used to log in to the anafora web interface. The username will also be used to identify the annotator responsible for any changes, so if you have multiple annotators you should add them all to this file before building the container. If you will be doing any adjudication, you should create usernames as necessary for adjudicators, and edit the Dockerfile line 14 by adding all adjudicator usernames as anafora-admin in a space-separated list.


