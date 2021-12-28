```shell
docker-compose pull
docker-compose up -d contact-center

docker-compose ps
docker-compose logs -f contact-center

docker-compose down
docker-compose restart

mvn -DskipTests clean package
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