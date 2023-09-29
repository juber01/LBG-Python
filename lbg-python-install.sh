docker build -t juber81/lbg-python .

docker stop lbg-python && (docker rm lbg-python) || (docker rm lbg-python $$ sleep 1 || sleep 1)

docker run -d -p 80:8080 --name lbg-python juber81/lbg-python