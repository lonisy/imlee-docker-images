


```yml
    mysql56:
      build: ./MySQL/5.6
      # image: ......
      ports:
        - "3306:3306"
      environment:
        MYSQL_ROOT_PASSWORD: yourpasspwd
      volumes:
        - /Volumes/data/Database/MySQL5.6/data(your host dir):/var/lib/mysql(your host dir)
        - /Volumes/data/Database/MySQL5.6/sock(your host dir):/var/run/mysqld(your host dir)
      container_name: mysql56

```