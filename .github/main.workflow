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
  runs = "build"
}

action "Deploy" {
  uses = "actions/npm@e7aaefed7c9f2e83d493ff810f17fa5ccd7ed437"
  needs = ["build"]
  runs = "firebase deploy --token "$FIREBASE_TOKEN"
  args = "1/4ct9T8S9g8ACRKN57JnJDuzHYtgCyBmQL3Sa7Ky1cbs"
}
