require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/enigma'

class EnigmaTest < MiniTest::Test

  def test_does_enigma_exist

    new_enigma = Enigma.new 
    assert_instance_of Enigma, new_enigma
  end


end
