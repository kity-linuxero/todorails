# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## 1.1.0 : 2016-12-30

### Added
- Introduce changelog.md ;)
- Validates uniqueness for slug (url).
- W3C validations for views.

### Changed
- High priority is no longer the default when creating a task.
- Deleted task 'Detail' column.
- Link to task details in task list view.
- Task details => link to his task list.
- Some code fixes
- Development time zone in Buenos Aires :)
- Slugged Unit Test

### Fixed
- The modification date in the task list is updated when deleting a task
- A cookie is deleted only when the data in the database is also deleted
- A cookie is saved only when the data in the database is persisted
- Expired is a valid status for TemporaryTask


## [1.0.0] (https://github.com/kity-linuxero/todorails/releases/tag/v1.0.0) - 2016-12-12
Work release!

## Added
- Responsive forms, navbar, infopages.
- pg gem (Postgresql) for production
- Deployed in Heroku

## Changed
- Error pages for mobile devices.
- Shows dates

## Fixed
- Grammar corrections
- Unit Test for Controllers
- Path images
- Some bug fixes

## 0.1.0 - 2016-12-09

* Initial release!

### Features:
* Task Lists
* Type of tasks:
 * Simple Task
 * Long Task
 * Temporary Task
* Task Lists will store in cookies
* Seeds
* Latest five task list shows in homepage (read from cookies)
* Menu: All my Tasks -> All task list from cookies.
* View based in Bootstrap 4
* MIT License
* Unit Test

Limitations:
* A task doesn't change type.
