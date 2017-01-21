defmodule Exscm do
  @moduledoc """
  Plugin for generating versions for a release from git.
  """

  def get_version() do
    version = case System.cmd("git", ["describe", "--tags", "--long", "--dirty"]) do
      {revision, 0} -> Exscm.Git.git_to_version(revision)
      {"", 128} -> "0.0.0"
    end
    case String.contains?(version, ".dirty") do
      true -> "#{version}"
      false -> "#{version}#{dirty()}"
    end
  end

  def before_assembly(%{} = release) do
    version = get_version()
    info "Creating release with version #{version}"
    %{release | version: version} # or nil
  end

  def after_assembly(_release), do: nil
  def before_package(_release), do: nil
  def after_package(_release), do: nil
  def after_cleanup(_args), do: nil

  defp info(message), do: apply(Mix.Releases.Logger, :info, ["exscm: " <> message])

  def dirty() do
    case System.cmd("git", ["status", "--porcelain", "--untracked-files=normal"]) do
      {"", 0} -> ""
      {_untracked, 0} -> ".dirty"
    end
  end

end
