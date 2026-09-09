import urllib.request
import urllib.error
import sys

ENDPOINT = "http://localhost/health"
TIMEOUT = 5

try:
    with urllib.request.urlopen(ENDPOINT, timeout=TIMEOUT) as response:
        if response.status == 200:
            print(f"OK: HTTPD is healthy (HTTP {response.status})")
            sys.exit(0)
        else:
            print(f"CRITICAL: HTTPD returned status {response.status}")
            sys.exit(1)
except urllib.error.HTTPError as e:
    print(f"CRITICAL: HTTPD returned HTTP {e.code}")
    sys.exit(1)
except Exception as e:
    print(f"CRITICAL: Connection failed - {e}")
    sys.exit(1)