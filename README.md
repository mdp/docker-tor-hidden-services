# A docker container for exposing docker services via Tor

Lovingly forked from @patrickod

This docker container allows you to easily expose ports on other containers as hidden services on the tor network.

## Usage

Lets say you have docker container running a web app that you want to expose as a hidden service on the tor network. In this container's Dockerfile it contains the following instruction.

```
EXPOSE 80
```

Running this as a hidden service is as simple as the following two commands

```bash
docker run --name webapp -d my-awesome-app
docker run --link webapp:web -d mdp/docker-tor-hidden-service
```

This will expose port 80 on the hidden service domain and direct it to your linked container.

### Using your own existing private_key

```bash
docker run --link webapp:web -v ~/private_key:/home/toruser/tor/hidden_service/private_key -d mdp/docker-tor-hidden-service
```
#### Generate a vanity key

You can use [Shallot](https://github.com/katmagic/Shallot) to create a vanity address. I've made it available on docker for ease of use.

```
docker run mpercival/shallot ./shallot ^foo
```
