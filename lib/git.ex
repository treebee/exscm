defmodule Exscm.Git do
  @moduledoc """
  Helper module which provides functions to generate a version string from
  current git hash
  """

  @doc ~S"""
  Gets the output from `git describe --tags --long --match '*.*'` and
  returns a version string.

  Tags have to be of the form `v1.0.3` or `1.0.3`. The leading 'v' will
  be stripped. The version also includes part of the git hash and a string
  giving the number of revisions after the latest tag.

  ## Example

    iex> Exscm.Git.git_to_version("v2.4.0-26-g743234")
    "2.4.1.dev26+ng743234"

  """  
  def git_to_version(revision) do
    case String.split(String.trim_leading(revision, "v"), "-") do
      [current_tag] ->
        current_tag
      [current_tag, "0", _] ->
        current_tag
      [current_tag, distance, hash] -> 
        "#{guess_next_tag(current_tag)}.dev#{distance}+n#{hash}"
      [current_tag, distance, hash, _dirty] ->
        "#{guess_next_tag(current_tag)}.dev#{distance}+n#{hash}.dirty"
    end
  end

  defp guess_next_tag(tag) do
    case String.split(tag, ".") do
      [major, minor, patch] ->
        "#{major}.#{minor}.#{String.to_integer(patch) + 1}"
      [major, minor] ->
        "#{major}.#{String.to_integer(minor) + 1}"
    end
  end
end
