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

Takes any ENV value

NOTES: 
- Anchor Blocks 
- Focus Blocks 
