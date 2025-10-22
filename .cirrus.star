load("cirrus", "http")

def on_task_completed(ctx):
  resp1 = http.get("https://httpbin.io/cache")
  print(resp1)

  # Delay for 3 seconds for the uncached "Date" header to reflect a different timepoint
  http.get("https://httpbin.io/delay/3")

  resp2 = http.get("https://httpbin.io/cache")
  print(resp2)
