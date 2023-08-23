docker run -d -p 5000:5000 --restart=always --name registry registry:2

docker pull nginx

docker tag nginx localhost:5000/nginx

docker push localhost:5000/nginx