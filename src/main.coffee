unless window.panelErrorLoaded
  window.panelErrorLoaded = true

  showErrors = ->
    bridge = new Bridge()

    unless bridge.debugMode
      bridge._startDebugMode()

    if window._panelErrors?.length > 0
      while window._panelErrors.length > 0
        console.error '[compilation-error]', window._panelErrors.pop()
    else
      console.error '[compilation-error]', 'Some error occured while trying to compile files on this page. Please refer to Terminal for more info'

  initErrorHandler = ->
    if window.Bridge
      showErrors()
    else
      script = document.createElement 'script'
      script.src = '/_panels/bridge.js'
      script.onlaod = showErrors
      script.onerror = ->
        console.error '[compilation-error]', 'Bridge client library cannot be loaded. Make sure your backend is live'
      document.body.appendChild script

  if document.readyState is 'complete'
    initErrorHandler()
  else
    window.addEventListener 'load', initErrorHandler
