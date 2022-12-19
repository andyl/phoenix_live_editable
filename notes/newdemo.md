# Making a New Demo Sub-App 

## Phoenix and Umbrella Projects

- an umbrella project can have multiple Phoenix sub-apps 
- each Phoenix sub-app listens on a separate port
- all sub-apps must depend on the same version of Phoenix

## Approach 

Step 1: Build and Test 

Build and test the demo app outside the umbrella, and install
`phoenix_live_editable` as a dependency.  See the README for more info.

Step 2: Make the Sub-App

```
cd phoenix_live_editable/apps 
mix phx.new ple_demo_newapp --no-ecto 
```

Edit the config files
- config/config.exs
- config/dev.exs
- config/prod.exs
- config/test.exs
- config/release.exs

Edit the nav menu in `ple_util`.

Incorporate the nav bar into your demo app. 

