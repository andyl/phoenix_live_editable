# Installing Phoenix.LiveEditable 

CONTENT TBD 

- the umbrella structure
- using a GitHub dependency 
- using a path dependency 

- using `live_editable` component & the `use LiveEditable` expression
- writing a handler 

ASSIGNS

These assigns can be configured by the developer: 

| Assign    | Description                   | Mutable?       |
|-----------|-------------------------------|----------------|
| id        | Component ID                  | no (never)     |
| focusid   | ID of 'in focus' component    | yes            |
| data      | The Component Data Value      | yes            |
| type      | Component Type (inline/popup) | no (typically) |
| interface | CSS interface                 | no (never)     |

These assigns are used internally: 

| mode | Component Mode | "focus" or "anchor" | yes |

CONFIGURATION

`config/config.exs`

```elixir
config :your_app, YourAppWeb.Endpoint,
  pubsub_server: PleDemoBase.PubSub,
  ...
  live_editable: [interface: Phoenix.LiveEditable.Interface.Milligram]
```
