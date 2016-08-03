# Docker memcached image

Memcached image based on rhel7.

## Testing

Get image:

`docker pull rhmap/memcached:latest`

Run container:

`docker run -d -p 11211:11211 rhmap/memcached`

## Build

Use make or execute:

`docker build -t rhmap/memcached .`

## Exposed ports:

- 11211
Port to access memcached
abc
def
