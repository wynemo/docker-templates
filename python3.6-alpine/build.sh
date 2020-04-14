mkdir -p ./pip_cache
touch ./pip_cache/${version}
echo "docker build is using proxy ${http_proxy} ${https_proxy}"
sudo docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} -f ./docker/Dockerfile ./ -t  $MAINIMAGE
sudo docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} -f ./docker/opencv/Dockerfile ./ -t watermark
echo "PWD is $PWD"
sudo docker run --rm --name pip_copyer -v $PWD/pip_cache:/tmp/pip_cache $MAINIMAGE sh -c 'cp /pip_cache/* /tmp/pip_cache/'
sudo docker run --rm --name pip_copyer -v $PWD/pip_cache:/tmp/pip_cache watermark sh -c 'cp /pip_cache/* /tmp/pip_cache/'
