# Шпаргалка по пакетному менеджеру NPM

### Установка npm

    curl https://npmjs.org/install.sh | sh

### Обновление npm
Есть несколько способов чтобы обновить npm. Я предпочитаю:

    curl https://npmjs.org/install.sh | sh

или

    npm install npm -g

### Поиск пакетов в npm

    npm search hook.io

Подсказка: Можно также использовать search.npmjs.org
Вторая подсказка: Для поиска необходимо знать имя нужного пакета (всё прекрасно ищет по любому слову как в имени пакета, так и в его описании, может неправильно перевёл?)

### Просмотр информации о пакете

    npm view hook.io

### Локальная установка пакетов
Для демонстрации возьмём пакет http-server.
http-server is a package we've written which provides an easy to use wrapper around node's core http.Server class. This module makes for a good example, since it's API provides both a CLI binary and a requirable node.js module.
http-server — пакет, который мы написали, предоставляет более простой интерфейс в использовании базового модуля http.Server из node.js. Этот модуль хороший пример использования API как для бинарного CLI, так и для подключаемого модуля node.js.

    npm install http-server

Так мы установим http-server в нашей рабочей директории.
Вы увидите новую папку в node_modules. Сейчас можете не обращать на это внимание.

### Установка пакета в наше приложение

    mkdir mynewapp/
    cd mynewapp
    npm install http-server
    touch test.js

test.js

    var HTTPServer = require('http-server');
    
    var httpServer = new HTTPServer({
      root: './public'
    });
    
    httpServer.start();

запустим скрипт
    
    node test.js

Обратите внимание, как мы делаем: require('http-server')? Что это за магия? (автор молодец)
http-server не является базовым модулем node.js. Этот пакет мы только что установили из npm. Node.js и npm взаимодействуют и автоматически подключают наши локальные модули из node_modules директории.

### Понимание разницы между глобальной и локальной установкой

По умолчанию npm будет устанавливать все пакеты в локальном каталоге, в которым вы сейчас работаете. Это правильно. Это может показаться немного запутанным, если вы раньше работали с предыдущими системами управления пакетами.
Например:

    mkdir anotherapp/
    cd anotherapp/
    touch test.js

test.js

    var HTTPServer = require('http-server');

теперь запустим наш скрипт

    node test.js

мы получим эту ошибку:
node.js:134
        throw e; // process.nextTick error, or 'error' event on first tick
        ^
Error: Cannot find module 'http-server'
    at Function._resolveFilename (module.js:326:11)
    at Function._load (module.js:271:25)
    at require (module.js:355:19)
    at Object.<anonymous> (/Users/maraksquires/dev/nodeapps/anotherapp/test.js:1:80)
    at Module._compile (module.js:411:26)
    at Object..js (module.js:417:10)
    at Module.load (module.js:343:31)
    at Function._load (module.js:302:12)
    at Array.<anonymous> (module.js:430:10)
    at EventEmitter._tickCallback (node.js:126:26)

Это вполне логично, мы установили http-server локально в "/mynewapp/", а не в "/anotherapp/".
Есть два решения в этой ситуации:
а) Установить ещё раз пакет, но локально в наше новое приложение

    cd anotherapp/
    npm install http-server

б) Установить пакет глобально

    npm install http-server -g

### Глобальная установка пакетов
Если вы хотите чтобы пакет был доступен всем приложениям, его нужно установить глобально:

    npm install http-server -g

Флаг -g означает, что http-server должен быть установлен глобально и быть доступными для всех приложений.
Теперь мы можем вызывать его require('http-server') в любом нашем приложении.

Кроме того, поскольку http-server пакет имеет свой исполняемый файл, то этот файл также будет установлен как исполняемый http-server и доступен в командах.
Теперь вы можете просто запустить команду:
http-server

### Удаление локально установленного пакета

    npm uninstall http-server

### Удаление глобально установленного пакета

    npm uninstall http-server -g

### Установка определённой версии пакета

    npm install http-server@0.3.0

### Установка модуля с Github
Важно. В некоторых случаях будут патчи, форки или ветви, которые вы хотите использовать, но которые еще не были опубликованы в npm. К счастью исходные коды для большинства npm модулей также доступна на www.github.com

    git clone git://github.com/nodeapps/http-server.git
    cd http-server/
    npm link

Теперь наша клонированная версия http-server связана локально.

### Связи любых пакетов локально
Если у вас есть отдельный каталог содержащий пакет npm, то можно создать локальную связь для него. Это удобно в ситуациях, когда мы не хотим опубликовать наш пакет в хранилище npm.

    cd http-server/
    npm link

На нашу локальную версию http-server создана «связана» для нашей локальной машины. (связь создаётся как «copy-paste», с начало нужно перейти в нужный катало и сделать «copy», потом перейти в нужный каталог и сделать «paste». Так вот сейчас мы изучили как делается «copy», а ниже будет про «paste» этого модуля)

### Связи локальных пакетов для нескольких приложений
Как мы видели ранее npm устанавливает пакеты в локальный каталог по умолчанию. Так вот npm ссылка(связь) работает почти так же.

    mkdir newapp/
    cd newapp/
    npm link http-server

Мы указываем, что теперь создали связь из http-server в наше новое приложение newapp. Если бы мы не выполнили npm link http-server, то получили бы ошибку об отсутствующем модуле. (а вот наш и «paste» о чём я писал выше, теперь вам должна быть понятна логика создания связей)

### Отмена связи между пакетами приложения

    cd newapp/
    npm unlink http-server

(здесь мы просто отменяем наш «paste» для этого приложения)

### Отмена связи пакета в системе

    cd http-server/
    npm unlink

(здесь мы отменяем наш «copy» для этого пакета)

### Создание нового пакета

    mkdir mypackage/
    cd mypackage/
    npm init

(от себя хочу лишь заметить, что создание пакета не такая простая задача в одну команду, подробнее можно почитать в другой статье)

### Добавление нового пользователя

    npm adduser

### Публикация пакета в репозиторий npm

    cd mypackage/
    npm publish

### Удаление пакета из репозитория npm

    npm unpublish http-server

### Управление правами доступа к пакетам в репозитории npm
Вы можете задать права доступа других пользователей к опубликованному пакету:

    npm owner add marak http-server
    npm owner rm marak http-server
    npm owner ls http-server
