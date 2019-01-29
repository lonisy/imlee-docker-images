


```yml

  mysql80:
    build: ./MySQL/8.0
    # image: ......
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: yourpasspwd
    volumes:
      - /data/MySQL8.0/data(your host dir):/var/lib/mysql(container dir)
    container_name: mysql80

```