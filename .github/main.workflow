workflow "Build and Push" {
  on = "push"
  resolves = ["Deploy"]
}

action "Install dependencies" {
  uses = "actions/npm@e7aaefed7c9f2e83d493ff810f17fa5ccd7ed437"
  runs = "install"
}

action "build" {
  uses = "actions/npm@e7aaefed7c9f2e83d493ff810f17fa5ccd7ed437"
  needs = ["Install dependencies"]
  runs = "run build"
}

action "Deploy" {
  uses = "w9jds/firebase-action@master"
  needs = ["build"]
  runs = "deploy --only hosting"
  secrets = ["1/4ct9T8S9g8ACRKN57JnJDuzHYtgCyBmQL3Sa7Ky1cbs"]
}
