load("cirrus", "http")

def on_task_completed(ctx):
  resp1 = http.get("https://httpbin.io/cache")
  print(resp1)

  resp2 = http.get("https://httpbin.io/cache")
  print(resp2)
