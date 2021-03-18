defmodule Phoenix.LiveEditable.Ui.Base do

  @callback form_text(String.t, [...]) :: String.t | {:error, String.t}
  @callback form_select(String.t, [...]) :: String.t | {:error, String.t}

  # TBD
  #
  # @callback form_radio
  # @callback form_calendar
  # @callback form_textarea
  # ...
  
end
