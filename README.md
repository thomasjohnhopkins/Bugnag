# Bugnag

A forum for sharing, viewing, and commenting on nagging bugs.

## Workflow

### Setting up on a new computer

Step 1: Clone the repo
`git clone git@github.com:thomasjohnhopkins/Bugnag.git`

Step 2: Navigate into the repo
`cd Bugnag`

Step 3: Make sure to bundle gems
`bundle install`

Step 4: Set up the npm dependencies
`npm install`

Step 5: Set up database and run all migrations
`rake db:create` then `rake db:migrate`

### Firing up the web app
In one tab of the console, run `rails s`.
In your web browser, navigate to http://localhost:3000/

That's it. If npm dependencies or new migrations have been added, you
need to run `npm install` and `rake db:migrate` again.

To populate the database with test data, run `rake db:seed`.

### Actual workflow

So here's a summary of the steps -

Step one: Create a local branch
`git checkout -b local-branch-name`

Step two: Once changes are finished and committed, fetch the origin,
then rebase over the base branch and resolve any conflicts.
`git fetch origin`
`git rebase origin/master`

Step three: Push the changes and create the pull request on github.
`git push origin local-branch-name`

Step 4: Give time for the other person to review the changes before merging it in.


## Languages
- TypeScript
- Ruby
- HTML / CSS

## Frameworks
- React
- Rails version 5.0.1

## Libraries and Technologies
- jbuilder
