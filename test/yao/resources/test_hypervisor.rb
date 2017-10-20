require "time"

class TestHypervisor < Test::Unit::TestCase
  def test_hypervisor
    params = {
      "status" => "enabled"
    }

    host = Yao::Hyppervisor.new(params)
    assert_equal(host.enabled?, true)
  end
end
