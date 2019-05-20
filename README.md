# LogViewer

Application to view your development and production logs in the browser

## Installation

* Clone the repository 

```bash
git clone https://github.com/aarushverma96/LogViewer.git
```
* Use bundler to install the gems required

```bash
bundle install
```
* Start background workers for resque 
```bash
PIDFILE=./resque.pid BACKGROUND=yes QUEUE="*" COUNT=4 RAILS_ENV=development rake resque:work >> resque.log
```
* Start redis server
```bash
redis-server
```
* Start rails server
```bash
rails server
```
* Visit [**http://localhost:3000/logs/development**](http://localhost:3000/logs/development)
