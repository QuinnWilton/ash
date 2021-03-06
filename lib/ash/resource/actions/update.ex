defmodule Ash.Resource.Actions.Update do
  @moduledoc "Represents a update action on a resource."

  defstruct [:name, :primary?, :accept, :changes, type: :update]

  @type t :: %__MODULE__{
          type: :update,
          name: atom,
          accept: [atom],
          primary?: boolean
        }

  @opt_schema [
    name: [
      type: :atom,
      doc: "The name of the action"
    ],
    accept: [
      type: {:custom, Ash.OptionsHelpers, :list_of_atoms, []},
      doc:
        "The list of attributes and relationships to accept. Defaults to all attributes on the resource"
    ],
    primary?: [
      type: :boolean,
      default: false,
      doc: "Whether or not this action should be used when no action is specified by the caller."
    ]
  ]

  @doc false
  def opt_schema, do: @opt_schema
end
