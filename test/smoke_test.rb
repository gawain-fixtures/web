require "minitest/autorun"

class SmokeTest < Minitest::Test
  APP = File.expand_path("../app", __dir__)

  def test_the_app_has_its_entry_point
    assert File.file?(File.join(APP, "web.rb"))
  end
end
