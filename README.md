# t2-people

## Contributing

This is an [ember.js](http://emberjs.com) application that uses [ember-cli](http://iamstef.net/ember-cli/) as a build tool.
And as mentioned above, it uses the [T2 API](https://github.com/neo/t2-api).  So, there's a bit to do to get going with a local build.

### Get the API up and running

The first thing to do is to clone the T2 API project locally and get it up and running.  Details for how to do
that are in the [README for that project](https://github.com/neo/t2-api) and outside the scope of this README.  Note that you need both the API (usually started via foreman and running on port 5000) and the t2-people app (port 7000) to execute the project locally.

### Install node, npm, and ember-cli

You'll need to have a reasonably modern version of [node.js](http://nodejs.org/) installed.

```bash
brew install node
npm install -g ember-cli
npm install
```

### Install vendor packages

```bash
bower install
```

### Ruby Dependency

Yeah, I know, it's a JavaScript app. However, sass is rad, and we like to use it. Oh, what was that? Did you say use `libsass`? I am aware of it's existence and it seems to lag behind. The majority of people using sass seem to be developing against the latest version and I'd like to use their packages. **tl;dr** Install you some ruby (see `.ruby-version`).

```
rbenv rehash (or rvm magical cd)
bundle install
```

### Fire it up

```
ember serve --port 7000
```

And then visit the page at [localhost:7000](http://localhost:7000) to verify that it works.

## Deployment

* Add your public key to `~/.ssh/authorized_keys` via the `neo` user at `t2static.neo.com`.
* Run `ember build --env production`

### Production

* Run `scp -r dist/* neo@t2static.neo.com:/var/www/t2people.neo.com`

### Staging

* **Known Issue**: Edit `dist/index.html`'s `ENV.apiHost` to be `t2-staging.neo.com` rather than `t2.neo.com`
* Run `scp -r dist/* neo@t2static.neo.com:/var/www/t2people-staging.neo.com`
