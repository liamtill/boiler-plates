If you want to use a MySQL DB instead of the MariaDB container then set up MySQL for Bookstack:

```
create database bookstackapp

create user 'bookstack'@'%' identified by '<PASSWORD>';

grant all privileges on bookstackapp.* to 'bookstack'@'%';
```

Then comment out the MariaDB section in the docker-compose.