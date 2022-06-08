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

## NextSteps

- [ ] Add edit example to milligram page 

- [ ] Get live-editable working on tailwind demo

# TBD

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

- [ ] Add Bootstrap5
- [ ] Add Bulma

