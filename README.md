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
* Controller Task List
```bash
  $ rails test test/controllers/task_lists_controller_test.rb
 ```
 
# Conceptos básicos
 
## Tareas (Tasks)
Son simplemente tareas o ítems a realizar. Las tareas pueden ser: 
* Simples (Simple Task)
* Largas (Long Task)
* Temporarias (Temporary Task)

### Simple Tasks:
 * Descripción
 * Estado
 * Prioridad (high, medium, low)

### Long Tasks:
* Descripción
* Progreso (en porcentaje)
* Estado (Status):
 * Pending (if 0%)
 * In progress (if 1% - 99%)
 * Done (if 100%)
* Prioridad (high, medium, low)


### Temporary Tasks:
 * Descripción
 * Estado (Status):
  * Done / Pending
  * Expired (if end_time > now)
 * Prioridad (high, medium, low)
 * Fecha/hora de inicio (start time)
 * Fecha/hora de fin (end time)


## Lista de tareas (Task Lists)
Son un conjunto de tareas (tasks).

Cada Task List se compone por:
* Descripción
* Fecha de creación
* Fecha de modificado (esta fecha se actualiza cuando una tarea perteneciente a la lista se agrega o modifica. Como tambien si la misma Task List se modifica).
* Tareas

# ¿Cómo se usa?
TODO-Rails se compone por:

## Página principal (home)

### Nueva lista
En la página principal podremos empezar a interactuar con el programa escribiendo el nombre de una lista de tareas. Simplemente escribir el nombre y hacer clic en 'Submit'. Eso nos llevará a la página de la nueva Task List.

### Last Task Lists:
Cuando hayamos creado al menos una Task List, aparecera un listado de las últimas Task Lists (hasta 5 máximo) con un link que nos llevará a la página de la Task List. También se nos indicará la cantidad de Tasks que contiene la Task List.
Cuando hayamos creado una Task List, se grabarán como cookies el id y el slug de la misma.

### All my task lists
Se muestran todas las Task List realizadas en nuestra sesión. En dicho listado podremos acceder a cada Task List, crear una nueva, modificar o borrar una existente.

### About
Acerca de TODO-Rails

## Nueva Task (New Task)
Una Task por si sola no tiene sentido. Tiene que pertenecer a una Task List.
Una vez creada una Task List podemos agregar Tasks.
Dentro de la página de una Task List, por ejemplo [http://localhost:3000/task_lists/cosas-para-hacer-en-la-semana](http://localhost:3000/task_lists/cosas-para-hacer-en-la-semana) tendremos la opción "New Task". Donde podremos crear una Task.

> Nota: Los campos que sean llenados y que no pertenecen al tipo de la Task seleccionada serán ignorados. Por ejemplo, en una Simple Task se ignorarán el 'Percentage of completion' y el rango de fechas start at y end at.

> Una vez creada una Taks NO PODRÁ CAMBIARSE el type (tipo) de tarea. Sin embargo se podrán modificar 'edit' todos los demás atributos de la misma. 
