# Phoenix.Editable.Renderers

Editable.Renderers are modules that render anchor and focus mode for a specific
CSS framework.

Renderers are modules that contain a collection of render functions.

The core activity of extending LiveEditable is to write new renderer classes.

Extend for: 
- Missing elements
- Missing CSS frameworks 
- behavior or style that you don't like 

Writing and using a new renderer is simple!
- extend the base module `Phoenix.Editable.Renderer.Base`
- use your new class in config

Coding Guidelines:
- no custom CSS - everything self-contained in your LiveEditable module (inline CSS)
- no custom Javascript or AlpineJS - use JS commands 

Interfaces that depend on JavaScript: 
- a lot of things are simpler with JS components (calendar, date picker, maps, images, etc.)
- best practice: add a mix task that does the JS install and integration 

Contributing extensions:
- welcome 
- please ask in advance

Contribution Models:
- just for your own use 
- merged into Phoenix.LiveEditable
- a standalone package 

The interface directory 
- TBD

