# Structure

← [Назад][back]

```
gmaps_crawler
├── src
│   └── gmaps_crawler
│        ├── __init__.py
│        ├── config.py (форма единственного числа)
│        ├── drivers.py
│        ├── entities.py
│        ├── exceptions.py
│        ├── facades.py
│        ├── main.py (форма единственного числа)
│        └── storages.py
│
├── .gitignore
├── pyproject.toml
└── README.md
```

Для того чтобы оснастить ваш проект такой возможностью — нужно добавить файл __main.py__ в главный модуль:

```
<project>
├── src
│   ├── example_module Главный модуль
│   │    ├── __init__.py
│   │    ├── __main__.py Добавьте сюда этот файл
│   │    └── many_files.py
│   │
│   └── tests/*
│        └── many_tests.py
│
├── .gitignore
├── pyproject.toml
└── README.md
```

И не забудьте, что и тут, в файле __main__.py, понадобится проверка __name__ == "__main__".

Когда вы установите свой модуль — вы сможете запускать его командой вида python -m example_module.

```
README.rst
LICENSE
setup.py
requirements.txt
sample/__init__.py
sample/core.py
sample/helpers.py
docs/conf.py
docs/index.rst
tests/test_basic.py
tests/test_advanced.py
```

```
Project/
|-- bin/
|   |-- project
|
|-- project/
|   |-- test/
|   |   |-- __init__.py
|   |   |-- test_main.py
|   |   
|   |-- __init__.py
|   |-- main.py
|
|-- setup.py
|-- README
```

```
sound/                          Top-level package
      __init__.py               Initialize the sound package
      formats/                  Subpackage for file format conversions
              __init__.py
              wavread.py
              wavwrite.py
              aiffread.py
              aiffwrite.py
              auread.py
              auwrite.py
              ...
      effects/                  Subpackage for sound effects
              __init__.py
              echo.py
              surround.py
              reverse.py
              ...
      filters/                  Subpackage for filters
              __init__.py
              equalizer.py
              vocoder.py
              karaoke.py
              ...
```

```
<project_name>/
        |
        +-- .gitignore           # Git configuration
        +-- .travis.yml          # Travis-CI configuration
        +-- bootstrap.py         # Buildout bootstrap-script
        +-- buildout.cfg         # Buildout project configuration
        +-- setup.cfg            # Configuration for py.test and other tools
        +-- README.md            # Information on how to use the project
        +-- src/                 # Directory for keeping (possible multiple) project eggs
                |
                +- <egg_name>/       # First egg of the project
                        |
                        +-- package/      # Python source files
                        +-- tests/        # Tests
                        +-- .gitignore    # Git configuration
                        +-- .travis.yml   # Travis-CI configuration
                        +-- setup.cfg     # Configuration for py.test and other tools
                        +-- setup.py      # Package metadata
                        +-- MANIFEST.in   # Files to include in the package
                        +-- README.rst    # Package description
                        +-- LICENSE.txt   # License
                        +-- CHANGELOG.txt # Changelog
```

```
project_name
├── docs
│   ├── make.bat
│   ├── Makefile
│   └── source
│       ├── conf.py
│       └── index.rst
├── examples
│   └── example.py
├── src
│   └── package_name
│       └── __init__.py
├── tests
│   └── __init__.py
├── .gitignore
├── LICENSE.txt
├── MANIFEST.in
├── README.rst
├── requirements.txt
├── setup.cfg
├── setup.py
└── tox.ini
```

### Application with Internal Packages

```
helloworld/
│
├── bin/
│
├── docs/
│   ├── hello.md
│   └── world.md
│
├── helloworld/
│   ├── __init__.py
│   ├── runner.py
│   ├── hello/
│   │   ├── __init__.py
│   │   ├── hello.py
│   │   └── helpers.py
│   │
│   └── world/
│       ├── __init__.py
│       ├── helpers.py
│       └── world.py
│
├── data/
│   ├── input.csv
│   └── output.xlsx
│
├── tests/
│   ├── hello
│   │   ├── helpers_tests.py
│   │   └── hello_tests.py
│   │
│   └── world/
│       ├── helpers_tests.py
│       └── world_tests.py
│
├── .gitignore
├── LICENSE
└── README.md
```

`bin/`: В этом каталоге хранятся любые исполняемые файлы. Я адаптировал это из классического сообщения Жан-Поля
Кальдерона о структуре, и его рекомендации по использованию bin/каталога по-прежнему важны. Самый важный момент, который
следует помнить, это то, что в вашем исполняемом файле не должно быть много кода, только импорт и вызов основной функции
в вашем скрипте runner. Если вы используете чистый Python или у вас нет исполняемых файлов, вы можете не использовать
этот каталог.

`/docs`: В более продвинутом приложении вам потребуется поддерживать хорошую документацию по всем его частям. Мне
нравится размещать здесь любую документацию по внутренним модулям, поэтому вы видите отдельные документы для helloworld
пакетов и . Если вы используете docstrings в своих внутренних модулях (а вы должны!), Ваша документация по всему модулю
должна, по крайней мере, давать целостное представление о назначении и функциях модуля.

`helloworld/`: Это похоже helloworld/ на предыдущую структуру, но теперь есть подкаталоги. По мере усложнения вам
захочется использовать тактику “разделяй и властвуй” и разбивать части логики вашего приложения на более управляемые
фрагменты. Помните, что имя каталога относится к общему имени пакета, и поэтому имена подкаталогов (hello/ и world/)
должны отражать имена их пакетов.

`data/`: Наличие этого каталога полезно для тестирования. Это центральное место для любых файлов, которые ваше
приложение будет использовать или создавать. В зависимости от того, как вы развертываете свое приложение, вы можете
сохранить входные и выходные данные “производственного уровня”, указывающие на этот каталог, или использовать его только
для внутреннего тестирования.

`tests/`: Здесь вы можете поместить все свои тесты — модульные тесты, тесты выполнения, интеграционные тесты и так
далее. Не стесняйтесь структурировать этот каталог наиболее удобным способом для ваших стратегий тестирования, стратегий
импорта и многого другого. Для получения дополнительной информации о тестировании приложений командной строки с помощью
Python ознакомьтесь с моей статьей 4 "Методы тестирования приложений командной строки (CLI) Python".

### Web Application Layouts

#### Django

```
project/
│
├── app/
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   │
│   ├── migrations/
│   │   └── __init__.py
│   │
│   ├── models.py
│   ├── tests.py
│   └── views.py
│
├── docs/
│
├── project/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
│
├── static/
│   └── style.css
│
├── templates/
│   └── base.html
│
├── .gitignore
├── manage.py
├── LICENSE
└── README.md
```

#### Flask

```
flaskr/
│
├── flaskr/
│   ├── ___init__.py
│   ├── db.py
│   ├── schema.sql
│   ├── auth.py
│   ├── blog.py
│   ├── templates/
│   │   ├── base.html
│   │   ├── auth/
│   │   │   ├── login.html
│   │   │   └── register.html
│   │   │
│   │   └── blog/
│   │       ├── create.html
│   │       ├── index.html
│   │       └── update.html
│   │ 
│   └── static/
│       └── style.css
│
├── tests/
│   ├── conftest.py
│   ├── data.sql
│   ├── test_factory.py
│   ├── test_db.py
│   ├── test_auth.py
│   └── test_blog.py
│
├── venv/
│
├── .gitignore
├── setup.py
└── MANIFEST.in
```

### Real project "omission"

```
omission-git
├── LICENSE.md
├── omission
│   ├── app.py
│   ├── common
│   │   ├── classproperty.py
│   │   ├── constants.py
│   │   ├── game_enums.py
│   │   └── __init__.py
│   ├── data
│   │   ├── data_loader.py
│   │   ├── game_round_settings.py
│   │   ├── __init__.py
│   │   ├── scoreboard.py
│   │   └── settings.py
│   ├── game
│   │   ├── content_loader.py
│   │   ├── game_item.py
│   │   ├── game_round.py
│   │   ├── __init__.py
│   │   └── timer.py
│   ├── __init__.py
│   ├── __main__.py
│   ├── resources
│   └── tests
│       ├── __init__.py
│       ├── test_game_item.py
│       ├── test_game_round_settings.py
│       ├── test_scoreboard.py
│       ├── test_settings.py
│       ├── test_test.py
│       └── test_timer.py
├── pylintrc
├── README.md
└── .gitignore
```

You'll see that I have one top-level package called omission, with four sub-packages: common, data, game, and tests. I
also have the directory resources, but that only contains game audio, images, etc. (omitted here for brevity). resources
is NOT a package, as it doesn't contain an __init__.py.

I also have another special file in my top-level package: __main__.py. This is the file that is run when we execute our
top-level package directly via python -m omission. We'll talk about what goes in that __main__.py in a bit.

← [Назад][back]

[back]: <.> "Назад к оглавлению"