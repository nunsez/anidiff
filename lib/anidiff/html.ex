defmodule Anidiff.Html do
  @moduledoc false

  @type html_tree() :: Floki.html_tree()

  @type html_node() :: Floki.html_node()

  @type document() :: html_tree() | html_node()

  @spec parse(String.t()) :: html_tree()
  def parse(html) do
    case Floki.parse_document(html) do
      {:ok, document} -> document
      _ -> []
    end
  end

  @spec find(document(), String.t()) :: html_tree()
  def find(document, selector) do
    Floki.find(document, selector)
  end

  @spec attribute(document(), String.t()) :: String.t() | nil
  def attribute(document, name) do
    case Floki.attribute(document, name) do
      [value | _] -> value
      _ -> nil
    end
  end

  @spec attribute(document(), String.t(), String.t()) :: String.t() | nil
  def attribute(document, selector, name) do
    case Floki.attribute(document, selector, name) do
      [value | _] -> value
      _ -> nil
    end
  end
end
