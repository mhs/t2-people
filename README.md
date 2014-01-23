# Lineman + Ember
A t2api app to view, query, and create "people".

If you haven't already done so, first: install [node.js](http://nodejs.org); next, install lineman:

$ npm install -g lineman

To work from this example, just clone into it and run:

```
$ npm install
$ lineman run
```

And then visit the page at [localhost:9999](http://localhost:9999) to verify that it works.

## Running tests
`TODO: verify this is correct`

To run the tests, you can do one of two things:

1. In one terminal run lineman run and (with it still running) run lineman spec, which will launch chrome and an ongoing interactive session with testem.

2. For a one-shot test run, first have phantomjs installed (brew install phantomjs) and then run lineman spec-ci which will run the tests headlessly

## Deploying

Both production and staging use the lineman buildpack and the
[user-env-compile](https://devcenter.heroku.com/articles/labs-user-env-compile) experimental option.

NOTE: because the files are rendered during slug compiliation, changing config variables will not work
until the code is redeployed.

Production environment:
* Git URI: git@heroku.com:t2-people.git
* Host: t2people.neo.com
* Heroku env - API_HOST: http://t2.neo.com
* Heroku env - BUILDPACK_URL: http://github.com/testdouble/heroku-buildpack-lineman.git

Staging environment:
* Git URI: git@heroku.com:t2people-staging.git
* Host: t2people-staging.neo.com
* Heroku env - API_HOST: http://t2-staging.neo.com
* Heroku env - BUILDPACK_URL: http://github.com/testdouble/heroku-buildpack-lineman.git

