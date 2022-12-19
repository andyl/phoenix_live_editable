# Phoenix Live Editable - Design Notes

## Phx 1.7 - Things to Explore 

- use PhxLiveStorybook? 
- best way to incorporate slots, attributes, JS calls?
- one component per type?  or use pattern matching?
- how to make it extensible by the developer?

## Live Components and Function Components 

** Phoenix.LiveEditable ** 

Just one LiveEditable for all types.

```
<.live_component module={Phoenix.LiveEditable} ...
```

** Phoenix.Editable ** 

A separate function component for each type.  Each function component calls the
`Phoenix.LiveEditable`.

```
<Editable.text @data="asdf" ple-save="qwer">HELLO</Editable.text>
<Editable.select @data="asdf" ple-save="qwer">HELLO</Editable.text>
```

Components:
- Editable.base
- Editable.text
- Editable.select
- Editable.calendar
- Editable.radio
- Editable.multiselect
- Editable.textarea
- Editable.color
- Editable.email
- Editable.number

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

## Password Config 

- Hidden input with 'show me' button 
- Length validation 
- Content validation 

