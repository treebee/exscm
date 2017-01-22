defmodule ExscmTest do
  use ExUnit.Case
  import Mock

  def git_mock("git", args, dirty) do
    case args do
      ["describe", "--tags", "--long", "--dirty"] -> {"v2.4.0-26-g743234#{dirty}", 0}
      ["status", "--porcelain", _] -> {"", 0}
    end
  end

  test "get version" do
    with_mock System, [cmd: fn("git", args) -> git_mock("git", args, "") end] do
      assert Exscm.get_version() == "2.4.1.dev26+ng743234"
    end
    
    with_mock System, [cmd: fn("git", args) -> git_mock("git", args, ".dirty") end] do
      assert Exscm.get_version() == "2.4.1.dev26+ng743234.dirty"
    end

  end
end
