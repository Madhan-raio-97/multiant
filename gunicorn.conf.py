# gunicorn.conf.py

import multiprocessing

# Server binding
bind = "0.0.0.0:8000"

# Number of worker processes
workers = multiprocessing.cpu_count() * 2 + 1  # or just set to a fixed number, e.g. 3

# Logging configuration
accesslog = "-"
errorlog = "-"
loglevel = "info"

# Timeout configuration
timeout = 30

# Maximum number of requests a worker can handle before being restarted
max_requests = 1000
max_requests_jitter = 50

# Worker class (default is 'sync', but 'gevent' or 'eventlet' may be used for async workloads)
worker_class = "sync"  # or "gevent" for asynchronous

# Preload the application (helps with memory optimization, but can affect certain setups)
preload_app = True

# Set the number of threads for each worker
threads = 2

# Enable access and error logging
access_log_format = '%(t)s %(h)s %(u)s %(r)s %(s)s %(b)s %(D)s'
