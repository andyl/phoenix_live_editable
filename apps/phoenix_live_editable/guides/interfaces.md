# Phoenix.LiveEditable Interfaces

LiveEditable Interfaces are modules that render anchor and focus mode.

Interfaces are modules that contain a collection of render functions.

The core activity of extending LiveEditable is to write new interface classes.

Extend for: 
- Missing elements
- Missing CSS frameworks 
- behavior or style that you don't like 

Writing and using a new interface is simple!
- extend the base module `Phoenix.LiveEditable.Interface.Base`
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

