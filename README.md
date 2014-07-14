# panel-error

Client library for handling compilation errors of coffee/browserify in [panel-static](https://github.com/panels/static), enabling live-relaod even when js can't be returned and shows error on frontend console.

## example

You have `<script src="app.coffee"></script>` in your page. When `app.coffee` can't be compiled by middleware, script from this repository is sent back instead and shows you what happend in Developer Tools and also establishes backup connection to live-relaod backend, so you don't need to reload after you fix the thing.

## internal implementation notes

This script is prepended with some info about the error that occured. It looks something like this

```js
window._panelErrors = window._panelErrors || []
window._panelErrors.push('Long error message, stacktrace, etc')

// and inlined error.js
```

## development

Edit `src/main.coffee`, use `npm run prepublish` to build compiled and minified `lib/error.js`.
