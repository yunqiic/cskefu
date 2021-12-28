```shell
sudo docker-compose build
sudo docker-compose down
sudo docker-compose up
sudo docker-compose up -d

sudo docker-compose up -d activemq
sudo docker-compose stop activemq
sudo docker-compose rm activemq

sudo docker-compose up -d mysql
sudo docker-compose stop mysql
sudo docker-compose rm mysql

sudo docker-compose up -d redis
sudo docker-compose stop redis
sudo docker-compose rm redis

sudo docker-compose up -d elasticsearch
sudo docker-compose stop elasticsearch
sudo docker-compose rm elasticsearch

sudo docker-compose up -d contact-center
sudo docker-compose stop contact-center
sudo docker-compose rm contact-center

sudo docker-compose up -d nginx
sudo docker-compose stop nginx
sudo docker-compose rm nginx

docker-compose pull
docker-compose up -d contact-center

docker-compose ps
docker-compose logs -f contact-center

docker-compose down
docker-compose restart

mvn -DskipTests clean package

cd contact-center/admin/
./build.sh
cd ../..
docker-compose up -d contact-center

docker rmi `docker images|grep none |  awk '{print $3}'`
```

```
http://10.2.100.2:8035
admin
admin1234

1）创建组织机构；
2）创建角色；
3）创建账号；
4）账号添加到组织机构；
5）账号添加到角色

角色【管理员】【高级坐席】【初级坐席】

初级坐席：仅具备坐席服务的基本资源读写权限
高级坐席：在初级坐席基础上，支持【坐席监控】等高级功能
管理员：可以查看【系统管理】并对管理员所在的组织机构和附属组织机构进行人员、设置等
```