# Nginx

← [Назад к перечню шпаргалок][back]

---

## Указание порта (включая SSL)

```
server {
  # Стадартный HTTP протокол
  listen 80;

  # Стандартный HTTPS протокол
  listen 443 ssl;

  # HTTP на 80-м порту с использованием IPv6
  listen [::]:80;

  # HTTP на 80-м порту с использованием ТОЛЬКО IPv6
  listen [::]:80 ipv6only=on;
}
```

## Логирование запросов

```
server {
  # Абсолютный путь к файлу
  access_log /path/to/file.log;

  # Включить запись ('on' или 'off')
  access_log on;
}
```

## Подключение домена

```
server {
  # Прослушивать yourdomain.com
  server_name yourdomain.com;

  # Прослушивать несколько доменов
  server_name yourdomain.com www.yourdomain.com;

  # Прослушивать все поддомены
  server_name *.yourdomain.com;
}
```

## Раздача статики

```
server {
  listen 80;
  server_name yourdomain.com;

  location / {
          root /path/to/website;
  } 
}
```

## Переадресация

```
# Переадресация для всех страниц
server {
  listen 80;
  server_name www.yourdomain.com;
  return 301 http://yourdomain.com$request_uri;
}

# Переадресация конкретной страницы
server {
  listen 80;
  server_name www.yourdomain.com;

  location /redirect-url {
     return 301 http://otherdomain.com;
  }
}
```

## Прокси (reverse proxy)

```
server {
  listen 80;
  server_name yourdomain.com;

  location / {
     proxy_pass http://localhost:3000;
     # localhost:3000 ваш сервер, запущенный локально (например: node.js)
  }
}
```

## Балансировка нагрузки (Round Robin)

```
upstream node_js {
  server 0.0.0.0:3000;
  server 0.0.0.0:4000;
  server 123.131.121.122;
}

server {
  listen 80;
  server_name yourdomain.com;

  location / {
     proxy_pass http://node_js;
  }
}
```

## Включение SSL (HTTPS)

```
server {
  listen 443 ssl;
  server_name yourdomain.com;

  ssl_certificate /path/to/cert.pem;
  ssl_certificate_key /path/to/privatekey.pem;

  ssl_stapling on;
  ssl_stapling_verify on;
  ssl_trusted_certificate /path/to/fullchain.pem;

  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_connection_timeout 1d;
  ssl_session_cache shared:SSL:50m;
  add_header Strict-Transport-Security max-age=15768000;
}

# Переадресация с HTTP на HTTPS
server {
  listen 80;
  server_name yourdomain.com;
  return 301 https://$host$request_uri;
}
```

## Ссылки

[https://habr.com/ru/articles/789360](https://habr.com/ru/articles/789360/)

---

← [Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"