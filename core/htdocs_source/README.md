# OpenXPKI UI - An Ember.js application

The web UI uses AJAX to retrieve structured data from the server and render
the pages using the Ember.js framework with the handlebars templating system.

This directory contains the developer code of the UI, this MUST NOT go onto
your webserver.

## Ember.js

Ember.js applications are compiled into single JavaScript files ("bundles").
After making modifications the source code has to be recompiled by `ember-cli`.

The easiest way to do that if you just updated some code is via the supplied
`Makefile` which uses Docker to compile the whole UI code:

```bash
make
```

For a full development stack on your machine please use the following
instructions.

## Development stack

You will need the following things properly installed on your computer.

* [Git](https://git-scm.com/)
* [Node.js](https://nodejs.org/) (with npm)
* [Ember CLI](https://ember-cli.com/)
* ([Google Chrome](https://google.com/chrome/) for unit tests)

### Node.js

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
cd core/htdocs_source
nvm install
```

### Ember CLI

```bash
nvm exec npm install -g ember-cli
```

## Installation of required Node.js modules

```bash
nvm exec npm install
```

## Running / Development

To run the web UI locally you have to:

1. Start an OpenXPKI backend via Docker or Vagrant. It's expected to listen on localhost:8080
2. Now run the Ember based web UI with live reload (on code changes) via:
   `npm run serve` (this calls "ember serve ..." and proxies AJAX requests to localhost:8080)
3. Visit the web UI at [http://localhost:4200/openxpki/#/](http://localhost:4200/openxpki/#/).
4. Visit tests at [http://localhost:4200/openxpki/#/test](http://localhost:4200/openxpki/#/test).

### Linting

```bash
nvm exec npm run lint:hbs
nvm exec npm run lint:js
nvm exec npm run lint:js -- --fix
```

### Building (production)

```bash
make
# or manually:
nvm exec npm run build
```

### Updating ember-cli

```bash
ember-cli-update
nvm exec npm install
nvm exec npm audit fix
nvm exec npm dedupe
```

### Running Tests (currently not used)

```bash
nvm exec ember test
nvm exec ember test --server
```

## Further Reading / Useful Links

* [ember.js](https://emberjs.com/)
* [ember-cli](https://ember-cli.com/)
* Development Browser Extensions
  * [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  * [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)
