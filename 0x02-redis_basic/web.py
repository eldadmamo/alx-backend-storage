#!/usr/bin/env python3
"""
Caching request module
"""
import redis
import requests
from functools import wraps
from typing import Callable

# Initialize the Redis client outside of the decorator for reuse
client = redis.Redis()

def track_get_page(fn: Callable) -> Callable:
    """ Decorator for get_page """
    @wraps(fn)
    def wrapper(url: str) -> str:
        """ Wrapper that:
            - Checks whether a URL's data is cached
            - Tracks how many times get_page is called
        """
        client.incr(f'count:{url}')
        cached_page = client.get(f'{url}')
        if cached_page:
            return cached_page.decode('utf-8')
        response = fn(url)
        client.set(f'{url}', response, ex=10)  # ex=10 sets expiration time to 10 seconds
        return response
    return wrapper

@track_get_page
def get_page(url: str) -> str:
    """ Makes an HTTP request to a given endpoint """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.text
    except requests.RequestException as e:
        return f"Error: {e}"

# Example usage
if __name__ == "__main__":
    url = "http://slowwly.robertomurray.co.uk/delay/5000/url/http://www.google.com"
    print(get_page(url))
