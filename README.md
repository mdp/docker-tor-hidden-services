# Docker tor hidden services

Lovingly forked from @patrickod

This docker container allows you to easily expose ports on other containers as hidden services on the tor network.

## Usage

Lets say you have docker container running a web app that you want to expose as a hidden service on the tor network. In this container's Dockerfile it contains the following instruction.

```
EXPOSE 80
```

Running this as a hidden service is as simple as the following two commands

```bash
$ docker run -d my-awesome-app
$ docker run --link my-hidden-web-app:web -d mdp/docker-tor-hidden-service
```

This will expose port 80 on the hidden service domain and direct it to your linked container.

### Using your own existing private_key

```bash
$ sudo chown root:root ~/private_key
$ sudo chmod 600 ~/private_key
$ docker run --link my-hidden-web-app:web -v ~/private_key:/var/lib/tor/hidden_service/private_key -d mdp/docker-tor-hidden-service
```

