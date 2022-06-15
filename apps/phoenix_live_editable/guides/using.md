# Using Phoenix.LiveEditable

- `use Phoenix.LiveEditable`
- avoiding the N+1 problem
- `live_editable_env/1` can be used in the mount function of the parent live view

ENV:

| Field     | Options            | Default                                  |
|-----------|--------------------|------------------------------------------|
| interface | <interface module> | Phoenix.LiveEditable.Interface.Milligram |
| type      | text, select, ...  | text                                     |
| mode      | inline, popup      | inline                                   |
| id        | <unique string>    | Required                                 |

    <.live_editable env=@edit_env id="asdf" action="save">

CONFIGURATION:

    # editable data - can be nil
    ple_data: nil,
    # form type: <text | select | multi-select | radio | ...>
    ple_type: "text",
    # render mode: <anchor | focus>
    ple_mode: "anchor",
    # display style: <inline | popup>
    ple_style: "inline",
    # storage for misc config attributes
    ple_store: %{},
    # submit action: anything
    ple_action: "ple-default-save",
    # appname: for looking up config settings
    ple_appname: nil,
    # target: pid of view
    ple_viewpid: nil,
    ple_datasrc: "component",
    # handler module - can reset in view or tag
    ple_handler: Phoenix.LiveEditable.ComponentHandler.Default,
    # interface module: see Phoenix.LiveEditable.Interface.*
    ple_interface: Phoenix.LiveEditable.Interface.Milligram,

HANDLERS:

- component-level handlers 
- view-level handlers 
- sending message from component to view 
- working examples

NOTES: 

- Anchor Blocks 
- Focus Blocks 


