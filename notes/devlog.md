# Phoenix Live Editable - DevLog

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

## TODO

- [ ] Move the LiveEditable logic from the master branch
- [ ] Build out the demo pages
- [ ] Test on a 3rd party app...
- [ ] Test in production
- [ ] Update the README page

