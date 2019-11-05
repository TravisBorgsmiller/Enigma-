require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/enigma'
require 'date'

class EnigmaTest < MiniTest::Test

  def test_does_enigma_exist

    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_does_message_encrypt

    enigma = Enigma.new
    assert enigma.encrypt("hello world", "02715", "040895").is_a?(Hash)
    expected = {:encryption=>"hello world", :key=>"02715", :date=>"040895"}
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_does_todays_date_default

    enigma = Enigma.new
    expected = {:encryption=>"hello world", :key=>"02715", :date=>Date.today.strftime('%m%d%y')}
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

end
