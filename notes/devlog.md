# Phoenix Live Editable - DevLog

# 2019 Sep 23 Mon

- [x] Initial Checkin
- [x] Create `Editable` Behavior
- [x] Implement `HTML` Editable 
- [x] Implement `Bootstrap4` Editable 
- [x] Implement `Milligram` Editable 
- [x] Create demo site

# 2019 Sep 23 Mon

- [x] Remove HTML demo
- [x] Add Bootstrap styles to demo site

# 2020 Jan 21 Tue

- [x] Create approach for Webpack config

## 2021 Mar 16 Tue

Overview:
- Decided to use an umbrella
- Web Demo and Library all in one repo
- Separate Phoenix demo apps for each CSS Framework
- Each Phoenix app listens on it's own port

Multiple Ports - Pros:
- it works
- PhoenixLiveReload works in development

Multiple Ports - Cons:
- awkward to host on VPS
- impossible to host on Heroku or Gigalixer

Multiple Phoenix Apps - Alternatives:
- using the 'forward' statement in the routes file: couldn't get websockets working
- using `jesseshieh/master-proxy` - couldn't get it working
- prefer to run all Phoenix apps on a single port
- but for now we'll use multiple ports...

- [x] Add link functions to LiveEditable
- [x] Add config info to umbrella parent
- [x] Add dependencies to subapps
- [x] Run end-to-end
- [x] Add Tailwind to live-editable-web (plus JIT compiler)
- [x] Add Tailwind to phx-demo-tailwind-web (plus JIT compiler and forms support)

## 2021 Mar 17 Wed

- [x] Update the README page
- [x] Move the LiveEditable logic from the master branch
- [x] Get LiveEditable working in demo page
- [x] Build out the working demo pages

## 2021 Mar 18 Thu

- [x] Merge to master
- [x] Install in a 3rd party app

## 2022 May 28 Sat

Improved tech:
- LV: function components, slots, JS Commands
- Phx Asset: esbuild, tailwind, dartsass
- Phx Release: mix release / docker 
- Fly.io: multi-port containers

Mix Package Publishing and Umbrellas: 
- can publish mix package from umbrella subapp
- run `mix hex.publish` from subapp root...

- [x] Rebuild demo apps from scratch 
- [x] Fix link helpers 
- [x] Setup milligram home page 
- [x] Fix base home page 
- [x] Add tailwind3 config 
- [x] Setup tailwind3 home page
- [x] Get running locally 

## 2022 May 29 Sun

- [x] Generate static assets for production 
- [x] Run locally in production (8080, 8081, 8082)
- [x] Generate valid links for `dev` and `prod`
- [x] Add runtime.exs 
- [x] Hardcode secret-key-base
- [x] Add `assets.deploy` mix task 
- [x] Generate release 
- [x] Run locally in release 
- [x] Generate docker file for demo app 

## 2022 May 30 Mon

- [x] Modify docker file for PLE 
- [x] Run locally in docker 
- [x] Document running demos using docker 
- [x] Publish docker image 
- [x] Test deploy on fly.io 

## 2022 May 31 Tue

- [x] Deploy on phoenix-live-editable.fly.io 
- [x] Menu bold on 80, 443, 8080 and 4040 
- [x] Generate docs for `phoenix_live_editable`
- [x] Test in standalone app using path dependency 
- [x] Test in standalone app using GitHub dependency 

## 2022 Jun 01 Wed

- [x] Design live-editable component

## 2022 Jun 02 Thu

- [x] Get live-editable working on base demo
- [x] Get live-editable working on milligram demo
- [x] Migrate to render functions for interface modules

## 2022 Jun 03 Fri

- [x] Fix milligram rendering 
- [x] Working milligram submit
- [x] Push PhoenixLiveEditable package to hex.pm 
- [x] Test in standalone app using hex dependency 
- [x] Make ple-util (HEEX helpers)
- [x] Remove "@focusid" from LiveView mount function (using `on_mount`)
- [x] Remove "@interface" from LiveView (using data in `on_mount` socket)

## 2022 Jun 04 Sat

- [x] LiveEditable config scoped to Phoenix App
- [x] Update documentation 

## 2022 Jun 08 Wed

Refactor: 
- single approach - use only stateful components 
- state stored in components 

Simple approach: `<.live_editable id="myid"/>`
- quick and fast
- changes stored in memory

Full approach: `<.live_editable ple-data="HelloWorld" ple-style="popup"/>`

Elements: 
- in view: `use Phoenix.LiveEditable` 
- in handler: `use Phoenix.LiveEditableHandler`

Handlers:
- only write event handlers to persist data
- UI and workflow supplied by `LiveEditable`

LiveEditable struct:

    # editable data - can be nil
    ple_data: nil,
    # form type: <text | select | multi-select | radio | ...>
    ple_type: "text",
    # render mode: <anchor | focus>
    ple_mode: "anchor",
    # display style: <inline | popup>
    ple_style: "inline",
    # submit action: anything
    ple_action: "save",
    # extra data storage
    ple_store: %{}, 
    # handler module - can reset in view or tag
    ple_handler: Phoenix.LiveEditable.Handler.Default,
    # interface module: see Phoenix.LiveEditable.Interface.*
    ple_interface: Phoenix.LiveEditable.Interface.Milligram,

- default values 
- over ride: struct -> config -> view -> tag -> handler 

Learnings:
- can only pass strings and ints in HEEX tags 
- every LV has a unique socket ID
- every LV runs in a unique process (until page reload) 
- need Agent attached to LV

## 2022 Jun 09 Thu 

- agents need :via name 
- via requires registry 
- add registry (Phoenix.LiveEditable.Registry) to `live_editable/application.ex` 
- create ViewCache module

## 2022 Jun 10 Fri

- [x] Create a LiveEditable registry for Agents
- [x] Attach an agent to the LiveView 
- [x] Write an Agent module (ViewCache) 

Design: 
- `on_mount`: create ViewCache & load config values 
- view module: ability to setup ViewCache values in `mount` and `update`
- tag: set values in tag 
- handler module: use `on_mount` to init values prior to rendering component (optional)

- [x] create helper methods (`.live_editable`, `.ple`)
- [x] make helper methods render interfaces 

## 2022 Jun 11 Sat

- [x] Get milligram working with anchor and focus 
- [x] handle nil data values 
- [x] Get form submit working 

## 2022 Jun 14 Tue

- [x] Get home-page example working 
- [x] Remove old code and test pages 

## 2022 Jun 15 Wed

- [x] Finish testpage navbar 
- [x] Fix home page
- [x] Add edit example to milligram page 
- [x] Write interface for tailwind3

# TBD

- [ ] Fix tailwind3 styling

- [ ] Validate Agent destruction when LiveView dies 

- [ ] Update ple-util (ETS datastore) 
- [ ] Datastore organized by IP address

- [ ] Add type=select

- [ ] Get modals working

- [ ] Design monitoring strategy 
- [ ] Integrate plausible.io 

- [ ] Add changelog 
- [ ] Write tests 
- [ ] Add CI 
- [ ] Auto-update docker on push-to-master
- [ ] Auto-update fly.io on push-to-master

- [ ] ExUnit Shared Examples for Milligram and Tailwind

- [ ] Get Validations Working
- [ ] Add RadioButton, DatePickers, etc.

- [ ] Create 'Coverage' Chart (red/yellow/green)
- [ ] ExUnit Unit Specs with LV test helpers

- [ ] Find one or two mentors 

- [ ] Add livebook interface 

- [ ] Add Bootstrap5
- [ ] Add Bulma

