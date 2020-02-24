
# [Kinzame](http://kinzame.herokuapp.com/ "Kinzame")
---
Cloud-based Loan Management Platform

## Development Guidelines

### Very-very Important!
- `master` branch will be used for releases only.
- Therefore: **DO NOT MERGE TO `master`**

### Do-not-forget!
- Please checkout to `development` since we're going to pool everything there first
- Create a new branch for each features, please
- `develop-[action]-[feature]` as a branch name
- Don't forget to make a `Pull Request` for each branch/development you're working on
- Change the tag both in our [Trello](https://trello.com/b/XQ6EWkbC/airbnb-program-week-project) and your ongoing [Pull Requests](https://github.com/rnd00/kinzame/pulls)
- _optional_ : Ask someone to review your newly-done function by adding them as the reviewer

## Running on your local

- Checkout to `development` and then run `git fetch --all` and `git pull`
- run `rails db:migrate` to get the _migration_ running up to the latest version
- ~~run `rails db:seed` to get the db ready with seeds~~ We don't have that yet
- run `rails s` to get the server up **locally**

---

## Credits

Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

