# projectmanager
大学生课外项目管理系统

主要完成内容为项目的管理

clone后，请在src/下面创建一个文件`my.properties`在里面填入：
```
# jdbc.X
jdbc.driverClassName=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://127.0.0.1:3306/projectmanager
jdbc.user=pm
jdbc.pass=pm

# hibernate.X
hibernate.dialect=org.hibernate.dialect.MySQL5Dialect
hibernate.show_sql=true
hibernate.hbm2ddl.auto=update
```