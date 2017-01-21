defmodule ExscmGitTest do
  use ExUnit.Case
  doctest Exscm.Git

  test "version from git" do
    assert Exscm.Git.git_to_version("0.1.0") == "0.1.0"
    assert Exscm.Git.git_to_version("v0.1.2") == "0.1.2"
    assert Exscm.Git.git_to_version("v0.1.2-0-g342333") == "0.1.2"
    assert Exscm.Git.git_to_version("v0.1.2-0-g342333-dirty") == "0.1.3.dev0+ng342333.dirty"
    assert Exscm.Git.git_to_version("v8.5.0-26-g638b869") == "8.5.1.dev26+ng638b869"
    assert Exscm.Git.git_to_version("v1.5-1-g638b869") == "1.6.dev1+ng638b869"
  end

end
