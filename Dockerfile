FROM dyalog/dyalog:18.0
USER root
ARG TO=sac
ENV TO=$TO 
# Args don't save in environment, so have to declare twice?
WORKDIR /app
COPY . /app

ENTRYPOINT ["sh","/app/docker/entrypoint.sh"]
