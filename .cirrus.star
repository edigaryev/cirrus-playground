load("cirrus", "env", "http")

def on_build_failed(ctx):
  resp = http.post("https://slack.com/api/chat.postMessage", headers={
    "Content-Type": "application/json",
    "Authorization": "Bearer " + env.get("SLACK_TOKEN"),
  }, json_body={
    "channel": "#testing-slack-automations",
    "text": "Build <https://cirrus-ci.com/build/{build_id}|{build_id} (\"{change_message_title}\")> failed on branch \"{branch_name}\" in repository \"{repository_name}\".".format(build_id=ctx.payload.data.build.id, change_message_title=ctx.payload.data.build.changeMessageTitle, branch_name=ctx.payload.data.build.branch, repository_name=ctx.payload.data.repository.name),
  })

  if resp.status_code != 200:
    fail("failed to post message to Slack: got unexpected HTTP {}".format(resp.status_code))

  resp_json = resp.json()

  if resp_json["ok"] != True:
    fail("got error when posting message to Slack: {}".format(resp_json["error"]))
