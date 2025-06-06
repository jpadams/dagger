# This file generated by `dagger_codegen`. Please DO NOT EDIT.
defmodule Dagger.ObjectTypeDef do
  @moduledoc """
  A definition of a custom object defined in a Module.
  """

  alias Dagger.Core.Client
  alias Dagger.Core.QueryBuilder, as: QB

  @derive Dagger.ID

  defstruct [:query_builder, :client]

  @type t() :: %__MODULE__{}

  @doc """
  The function used to construct new instances of this object, if any
  """
  @spec constructor(t()) :: Dagger.Function.t() | nil
  def constructor(%__MODULE__{} = object_type_def) do
    query_builder =
      object_type_def.query_builder |> QB.select("constructor")

    %Dagger.Function{
      query_builder: query_builder,
      client: object_type_def.client
    }
  end

  @doc """
  The doc string for the object, if any.
  """
  @spec description(t()) :: {:ok, String.t()} | {:error, term()}
  def description(%__MODULE__{} = object_type_def) do
    query_builder =
      object_type_def.query_builder |> QB.select("description")

    Client.execute(object_type_def.client, query_builder)
  end

  @doc """
  Static fields defined on this object, if any.
  """
  @spec fields(t()) :: {:ok, [Dagger.FieldTypeDef.t()]} | {:error, term()}
  def fields(%__MODULE__{} = object_type_def) do
    query_builder =
      object_type_def.query_builder |> QB.select("fields") |> QB.select("id")

    with {:ok, items} <- Client.execute(object_type_def.client, query_builder) do
      {:ok,
       for %{"id" => id} <- items do
         %Dagger.FieldTypeDef{
           query_builder:
             QB.query()
             |> QB.select("loadFieldTypeDefFromID")
             |> QB.put_arg("id", id),
           client: object_type_def.client
         }
       end}
    end
  end

  @doc """
  Functions defined on this object, if any.
  """
  @spec functions(t()) :: {:ok, [Dagger.Function.t()]} | {:error, term()}
  def functions(%__MODULE__{} = object_type_def) do
    query_builder =
      object_type_def.query_builder |> QB.select("functions") |> QB.select("id")

    with {:ok, items} <- Client.execute(object_type_def.client, query_builder) do
      {:ok,
       for %{"id" => id} <- items do
         %Dagger.Function{
           query_builder:
             QB.query()
             |> QB.select("loadFunctionFromID")
             |> QB.put_arg("id", id),
           client: object_type_def.client
         }
       end}
    end
  end

  @doc """
  A unique identifier for this ObjectTypeDef.
  """
  @spec id(t()) :: {:ok, Dagger.ObjectTypeDefID.t()} | {:error, term()}
  def id(%__MODULE__{} = object_type_def) do
    query_builder =
      object_type_def.query_builder |> QB.select("id")

    Client.execute(object_type_def.client, query_builder)
  end

  @doc """
  The name of the object.
  """
  @spec name(t()) :: {:ok, String.t()} | {:error, term()}
  def name(%__MODULE__{} = object_type_def) do
    query_builder =
      object_type_def.query_builder |> QB.select("name")

    Client.execute(object_type_def.client, query_builder)
  end

  @doc """
  The location of this object declaration.
  """
  @spec source_map(t()) :: Dagger.SourceMap.t()
  def source_map(%__MODULE__{} = object_type_def) do
    query_builder =
      object_type_def.query_builder |> QB.select("sourceMap")

    %Dagger.SourceMap{
      query_builder: query_builder,
      client: object_type_def.client
    }
  end

  @doc """
  If this ObjectTypeDef is associated with a Module, the name of the module. Unset otherwise.
  """
  @spec source_module_name(t()) :: {:ok, String.t()} | {:error, term()}
  def source_module_name(%__MODULE__{} = object_type_def) do
    query_builder =
      object_type_def.query_builder |> QB.select("sourceModuleName")

    Client.execute(object_type_def.client, query_builder)
  end
end

defimpl Jason.Encoder, for: Dagger.ObjectTypeDef do
  def encode(object_type_def, opts) do
    {:ok, id} = Dagger.ObjectTypeDef.id(object_type_def)
    Jason.Encode.string(id, opts)
  end
end

defimpl Nestru.Decoder, for: Dagger.ObjectTypeDef do
  def decode_fields_hint(_struct, _context, id) do
    {:ok, Dagger.Client.load_object_type_def_from_id(Dagger.Global.dag(), id)}
  end
end
