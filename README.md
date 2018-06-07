# TODO-Rails
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](https://gitlab.com/giambcri/todorails/raw/bc2bfb2b644f642bd225fa19ef9f3fbdd0ffc067/LICENSE)

TODO-Rails es una aplicación desarrollada con Ruby on Rails 5.0 como trabajo integrador de la materia Taller de Tecnologías de producción de Software opción Lenguaje Ruby (cursada 2016) de la Universidad Nacional de La Plata.

# ¿Cómo pruebo TODO-Rails? Demo en HEROKU
TODO-Rails está online en HEROKU para que lo puedas usar y probar.
[https://todorails-ttps.herokuapp.com/](https://todorails-ttps.herokuapp.com/)

# Instalación:
## Requerimientos

* Ruby ~> 2.5.1
* Bundler
* Rails ~> 5.0.1

## ¿Cómo instalo TODO-Rails?

### Descargar código fuente:
* [Repositorio Gitlab] (https://gitlab.com/giambcri/todorails.git)
* O desde la consola:

  ```bash
  $ git clone https://gitlab.com/giambcri/todorails.git
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

### Test case
[http://localhost:3000/task_lists/lista-0](http://localhost:3000/task_lists/lista-0)

# Unit Test

```bash
  $ rails test
 ```
