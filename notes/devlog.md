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
- using `jesseshieh/master_proxy` - couldn't get it working
- prefer to run all Phoenix apps on a single port
- but for now we'll use multiple ports...

- [x] Add link functions to LiveEditable
- [x] Add config info to umbrella parent
- [x] Add dependencies to subapps
- [x] Run end-to-end
- [x] Add Tailwind to live_editable_web (plus JIT compiler)
- [x] Add Tailwind to phx_demo_tailwind_web (plus JIT compiler and forms support)

## 2021 Mar 17 Wed

- [x] Update the README page
- [x] Move the LiveEditable logic from the master branch
- [x] Get LiveEditable working in demo page
- [x] Build out the working demo pages

## TODO

- [ ] Test on a 3rd party app
- [ ] Cleanup demo apps
- [ ] Test in production
- [ ] Merge to master

# TBD

- [ ] Redo config to support multi-frameworks

- [ ] Host demo site (PhoenixLiveEditable.com)

- [ ] Get Validations Working
- [ ] Add RadioButton, DatePickers, etc.

- [ ] Get modals working
- [ ] ExUnit Shared Examples for HTML, Bootstrap4 and Milligram
- [ ] Create 'Coverage' Chart (red/yellow/green)
- [ ] ExUnit Unit Specs with LV test helpers

