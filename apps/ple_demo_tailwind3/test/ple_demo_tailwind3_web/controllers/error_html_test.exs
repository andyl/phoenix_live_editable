defmodule PleDemoTailwind3Web.ErrorHTMLTest do
  use PleDemoTailwind3Web.ConnCase, async: true

  # Bring render_to_string/3 for testing custom views
  import Phoenix.Template

  test "renders 404.html" do
    assert render_to_string(PleDemoTailwind3Web.ErrorHTML, "404", "html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(PleDemoTailwind3Web.ErrorHTML, "500", "html", []) == "Internal Server Error"
  end
end
