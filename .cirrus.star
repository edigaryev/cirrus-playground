load("cirrus", "env", "fs")


def on_task_created(ctx):
    print(env.get("CIRRUS_REPO_CLONE_HOST"))
    print(env.get("CIRRUS_REPO_CLONE_TOKEN") == None)

    for entry in fs.readdir("."):
        print(entry)
