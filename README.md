# TODO-Rails

TODO-Rails es una aplicación desarrollada con Ruby on Rails 5.0.1 como trabajo integrador de la materia Taller de Tecnologías de producción de Software opción Lenguaje Ruby (cursada 2016) de la Universidad Nacional de La Plata.

# Instalación:
## Requerimientos

* Ruby 2.3.1
  ```bash
  # apt-get install -y autoconf bison build-essential lib{ssl,yaml,sqlite3}-dev libreadline6{,-dev} zlib1g{,-dev}
  $ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  $ cd ~/.rbenv && src/configure && make -C src
  $ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  $ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  $ source ~/.bashrc
  $ rbenv install 2.3.1
  $ rbenv global 2.3.1
  ```
  Puede comprobar la versión de Ruby instalada:
  ```bash
  $ ruby --version
  ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]
  ```
  
* Bundler (Instrucciones a continuación)
* Rails 5.0 (Instrucciones a continuación)

## ¿Cómo instalo TODO-Rails?
Una vez instalado Ruby,
### Descargar código fuente:
* [Repositorio Github] (https://github.com/kity-linuxero/todorails.git)
* O desde la consola:

  ```bash
  $ git clone https://github.com/kity-linuxero/todorails.git
  ```
  * De no tener git instalado, instalar con:
  ```bash
    $ sudo apt-get install git
    ```
  
### Gemas:
* Bundler:
```bash
  $ gem install bundler
  ```
* Rails y otras gemas requeridas por TODO-Rails
```bash
  $ bundle install
  ```
  * Para este último comando, se debe estar ubicado sobre el directorio donde se copió el repositorio.
  
### Preparar base de datos:
TODO-Rails provee de datos pre-cargados (seeds) para poder probar el software sin necesidad de tener que cargar numerosas entradas.

Para eso es necesario:
* Migración y preparación de base de datos:
```bash
  $ rails db:setup
  ```
### Ejecutar web server
Para iniciar el web server:
```bash
  $ rails s
```

### ¡Listo!
Para acceder:
[http://localhost:3000](http://localhost:3000)

### ¿Un caso de prueba?
[http://localhost:3000/task_lists/lista-0](http://localhost:3000/task_lists/lista-0)

# Unit Test
Puedes correr los Unit Test para esta aplicación.

* Para el modelo de TaskList:
```bash
  $ rails test test/models/task_list_test.rb
 ```
* Para el modelo de Task
```bash
  $ rails test test/models/task_test.rb
 ```
