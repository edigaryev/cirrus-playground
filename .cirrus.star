load("cirrus", "env", "http", "fs")

def main(ctx):
  print("run 1")

  # Consult the actual rate limit value
  headers = {
    "Authorization": "Bearer " + env.get("CIRRUS_REPO_CLONE_TOKEN")
  }
  remaining = http.get("https://api.github.com/rate_limit", headers=headers).json()["rate"]["remaining"]
  print("requests remaining until rate-limit", remaining)

  # Perform an operation that consumes GitHub API rate limit
  print("making a request to list / directory contents...")
  print(fs.readdir("/"))

  # Consult the actual rate limit value
  remaining = http.get("https://api.github.com/rate_limit", headers=headers).json()["rate"]["remaining"]
  print("requests remaining until rate-limit", remaining)

  # Perform an operation that consumes GitHub API rate limit again
  print("making a request to list / directory contents...")
  print(fs.readdir("/"))

  # Consult the actual rate limit value
  remaining = http.get("https://api.github.com/rate_limit", headers=headers).json()["rate"]["remaining"]
  print("requests remaining until rate-limit", remaining)

  return []
