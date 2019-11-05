require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/enigma'
require 'date'

class EnigmaTest < MiniTest::Test

  def test_does_enigma_exist

    enigma = Enigma.new
    assert_instance_of Enigma, new_enigma
  end

  def test_does_message_encrypt

    enigma = Enigma.new
    require "pry"; binding.pry
    enigma.encrypt("hello world", "02715", "040895")
    assert_equal "hello world", enigma.message
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
  end

end
