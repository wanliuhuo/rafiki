MODULE_NAME=rafiki_admin

docker build -t $MODULE_NAME -f ./deploy/admin.Dockerfile $PWD
docker run --rm --name $MODULE_NAME \
  --network $DOCKER_NETWORK \
  -e POSTGRES_HOST=$POSTGRES_HOST \
  -e POSTGRES_PORT=$POSTGRES_PORT \
  -e POSTGRES_USER=$POSTGRES_USER \
  -e POSTGRES_DB=$POSTGRES_DB \
  -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
  -e APP_SECRET=$APP_SECRET \
  -e LOGS_FOLDER_PATH=$LOGS_FOLDER_PATH \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $LOGS_FOLDER_PATH:$LOGS_FOLDER_PATH \
  -p 8000:8000 \
  $MODULE_NAME