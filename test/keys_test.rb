require './lib/enigma'
require './lib/keys'
require 'date'
require './test/test_helper'

class KeysTest < MiniTest::Test

  def test_does_keys_exist

    new_key = Key.new
    assert_instance_of Key, new_key
  end


end
