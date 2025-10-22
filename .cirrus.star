load("cirrus", "env", "http", "fs")

def main(ctx):
  check_rate_limit()

  # Perform an operation that consumes GitHub API rate limit
  print("making a request to list / directory contents...")
  fs.readdir("/")

  check_rate_limit()

  return []

def check_rate_limit():
    # Consult the actual rate limit value
    headers = {
      "Authorization": "Bearer " + env.get("CIRRUS_REPO_CLONE_TOKEN")
    }
    remaining = http.get("https://api.github.com/rate_limit", headers=headers).json()["rate"]["remaining"]
    print("requests remaining until rate-limit", remaining)
