# Phoenix Live Editable - DevLog

## 2021 Mar 16 Tue

Overview:
- Decided to use an umbrella
- Web Demo and Library all in one repo
- Separate Phoenix demo apps for each CSS Framework
- Each Phoenix app listens on it's own port

Multiple Phoenix Apps - Alternatives:
- using the 'forward' statement in the routes file: couldn't get websockets working
- using `jesseshieh/master_proxy` - couldn't get it working
- prefer to run all Phoenix apps on a single port
- but for now we'll use multiple ports...

## TODO

- [ ] Add Tailwind to live_editable_web (plus JIT compiler)
- [ ] Add Tailwind to phx_demo_tailwind_web (plus JIT compiler)
- [ ] Use TailwindUI in live_editable_web
- [ ] Move the LiveEditable logic from the master branch
- [ ] Build out the demo pages

