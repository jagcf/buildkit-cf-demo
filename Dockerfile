# syntax=docker/dockerfile:experimental

FROM alpine

# install ssh client and git

RUN apk add --no-cache openssh-client git

# download public key for github.com

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

# clone our private repository

RUN --mount=type=ssh,id=github git clone git@github.com:jagcf/buildkit-cf-demo.git

RUN  ls -ltr
