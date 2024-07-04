FROM python:alpine3.19

RUN apk add ffmpeg pipx

RUN pipx install twitch-dl

RUN cp /root/.local/bin/twitch-dl /bin
