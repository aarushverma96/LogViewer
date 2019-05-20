# LogViewer

Application to view your development and production logs in the browser.

## Architecture
For every request made by client side following things takes place :-
* Logs Controller renders last 10 lines of the log file
* It calls a background job BrodcastJob.
* BroadcastJob opens a websocket connection on development/test/production channel to client using ActionCable.
* Updating file content gets appended to the rendered web page using logs.coffee script.

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
