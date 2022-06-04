# Phoenix Live Editable - Design Notes

## Scoping Interface Config to Phoenix App

Config Scope: 

- By phoenix application (in config)
- By liveview page (in LiveView Mount) 
- By component (in invocation)

Approach:

- use `onmount` lifecycle callback
- grab EndPoint from session param 

Reference: 

    app_name = Application.get_application(__MODULE__)
    interface = Application.fetch_env(app_name, :css_framework) 

## Simplification 

- [x] Remove "@focusid" from LiveView mount function (using `on_mount`)
- [ ] Remove "@interface" from LiveView (using data in `on_mount` socket)
- [ ] Remove "@focusid" from component params (using pubsub)

## Page Coordination

Options: 

- unique on page - only one open at a time 
- next/prev - next prev navigation 
- independant on page - multiple components can be open at once 

PubSub: 

- coordination of which components are focused
- live data sync with other users 
- live data sync with other page components 

## Directory 

- AutoGenerate Directory of supported and 3rd party interfaces 
- AutoGenerate working demo examples
