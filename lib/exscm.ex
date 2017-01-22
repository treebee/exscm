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

  def dirty() do
    case System.cmd("git", ["status", "--porcelain", "--untracked-files=normal"]) do
      {"", 0} -> ""
      {_untracked, 0} -> ".dirty"
    end
  end

end
