pull-wordpress:
  cmd.run:
    - name: docker pull wordpress:latest

pull-mariadb:
  cmd.run:
    - name: docker pull mariadb

wordpress-container1:
  cmd.run:
    - names:
      - mkdir -p /wordpress
      - mkdir -p /wordpress/database
      - mkdir -p /wordpress/html
      - docker run -e MYSQL_ROOT_PASSWORD=toor -e MYSQL_USER=toor -e MYSQL_PASSWORD=root -e MYSQL_DATABASE=wordpress_db -p 3306/tcp -v /root/wordpress/database:/var/lib/mysql --name wordpressdb -d $
      - docker run -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=toor -e WORDPRESS_DB_NAME=wordpress_db -p 8081:80 -v /root/wordpress/html:/var/www/html --link wordpressdb:mysql --name wpconta$
    - creates: /wordpress

wordpress-container2:
  cmd.run:
    - names:
      - mkdir -p /wordpress2
      - mkdir -p /wordpress2/database
      - mkdir -p /wordpress2/html
      - docker run -e MYSQL_ROOT_PASSWORD=toor -e MYSQL_USER=root -e MYSQL_PASSWORD=toor -e MYSQL_DATABASE=wordpress_db2 -p 3307/tcp -v /root/wordpress2/database:/var/lib/mysql --name wordpressdb2 $
      - docker run -e WORDPRESS_DB2_USER=root -e WORDPRESS_DB2_PASSWORD=toor -e WORDPRESS_DB2_NAME=wordpress_db2 -p 8082:80 -v /root/wordpress2/html:/var/www/html --link wordpressdb2:mysql --name w$
    - creates: /wordpress2
