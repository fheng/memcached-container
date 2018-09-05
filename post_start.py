#!/usr/bin/env python
# Import libraries
from pymemcache.client import base

client = base.Client(('localhost', 11211))
print(client.get("b3456e1b54bf894f406f47cb9d12d0ad"))
