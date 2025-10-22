load("cirrus", "http")

def on_task_completed(ctx):
  resp1 = http.get("http://example.com/")
  print(resp1)
  resp2 = http.get("http://example.com/")
  print(resp2)
