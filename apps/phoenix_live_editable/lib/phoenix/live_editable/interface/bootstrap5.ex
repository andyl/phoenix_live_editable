# defmodule Phoenix.LiveEditable.Interface.Bootstrap5 do
#
#   @moduledoc """
#   TBD
#   """
#
#   alias Phoenix.LiveEditable.Interface
#
#   require Phoenix.LiveEditable.Svg
#   alias Phoenix.LiveEditable.Svg
#
#   @behaviour Interface.Base
#
#   @doc """
#   <%= live_edit(assigns, @register.name, type: "text", id: "name", on_submit: "rename") %>
#   """
#   @impl Interface.Base
#   def text_focus(label, opts) do
#     target = if opts[:target], do: "phx-target='#{opts[:target]}'", else: ""
#     change = "phx-change='#{opts[:on_change]}'"
#     submit = "phx-submit='#{opts[:on_submit]}'"
#     """
#     <form class="form-inline" #{change} #{submit} #{target}>
#     <div class="mb-2 form-group">
#       <input type="text" class="form-control" name="editable_text" value="#{label}">
#     </div>
#     <button class="btn btn-primary mb2 btn-ple" style='margin-left: 5px' type='submit'>
#       #{ Svg.inline("SquareOk") }
#     </button>
#     <button class="btn btn-secondary mb2 btn-ple" style='margin-left: 5px' phx-click='cancel'>
#       #{ Svg.inline("SquareCancel") }
#     </button>
#     </form>
#     """
#   end
#
#   @doc """
#   <%= live_edit(assigns, @register.name, type: "text", id: "name", on_submit: "rename") %>
#   """
#   @impl Interface.Base
#   def text_anchor(label, _opts) do
#     # target = if opts[:target], do: "phx-target='#{opts[:target]}'", else: ""
#     # change = "phx-change='#{opts[:on_change]}'"
#     # submit = "phx-submit='#{opts[:on_submit]}'"
#     """
#     <span><#{ label }</span>
#     """
#   end
#
#   @doc """
#   Options is a list of tuples {<id>, <label>}
#   <%= live_edit(assigns, @folder.name, type: "select", options: @folders, id: "folder", on_submit: "refolder") %>
#   """
#   @impl Interface.Base
#   def select_focus(label, opts) do
#     Keyword.has_key?(opts, :options) || raise("Needs `:options` option")
#     options = Enum.map(opts[:options], &("<option value='#{elem(&1,0)}'>#{elem(&1,1)}</option>"))
#     target = if opts[:target], do: "phx-target='#{opts[:target]}'", else: ""
#     submit = "phx-submit='#{opts[:on_submit]}'"
#     """
#     <form class="form-inline" #{target} #{submit}>
#     <div class="form-group col-md-6">
#       <select name="editable_select" class="form-control" value="#{label}">
#       #{Enum.join(options, "")}
#       </select>
#     </div>
#     <button class="btn btn-primary mb2 btn-ple" style='margin-left: 5px' type='submit'>
#       #{ Svg.inline("SquareOk") }
#     </button>
#     <button class="btn btn-secondary mb2 btn-ple" style='margin-left: 5px' phx-click='cancel'>
#       #{ Svg.inline("SquareCancel") }
#     </button>
#     </form>
#     """
#   end
#
#   @impl Interface.Base
#   def select_anchor(label, _opts) do
#     # target = if opts[:target], do: "phx-target='#{opts[:target]}'", else: ""
#     # change = "phx-change='#{opts[:on_change]}'"
#     # submit = "phx-submit='#{opts[:on_submit]}'"
#     """
#     <span><#{ label }</span>
#     """
#   end
#
# end
