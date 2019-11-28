web: flask db upgrade; flask translate compile; gunicorn microcmp:app
worker: rq worker microcmp-tasks
