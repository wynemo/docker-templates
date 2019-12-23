mkdir -p ./sonarx/pip_cache
touch ./sonarx/pip_cache/${version}
echo "docker build is using proxy ${http_proxy} ${https_proxy}"
sudo docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} -f ./sonarx/docker/Dockerfile ./sonarx/ -t  $MAINIMAGE
sudo docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} -f ./sonarx/docker/opencv/Dockerfile ./sonarx/ -t sonar_watermark
echo "PWD is $PWD"
sudo docker run --rm --name pip_copyer -v $PWD/sonarx/pip_cache:/tmp/pip_cache $MAINIMAGE sh -c 'cp /pip_cache/* /tmp/pip_cache/'
sudo docker run --rm --name pip_copyer -v $PWD/sonarx/pip_cache:/tmp/pip_cache sonar_watermark sh -c 'cp /pip_cache/* /tmp/pip_cache/'
