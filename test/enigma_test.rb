require './lib/enigma'
require 'date'
require './test/test_helper'


#rewrite all encryption tests so they show encrypted text with initialize methods too

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

  def test_does_random_key_generate

    enigma = Enigma.new
    expected_1 = {:encryption=>"hello world", :key=>"00044", :date=>Date.today.strftime('%m%d%y')}
    assert_equal expected_1, enigma.encrypt("hello world", "44")
    #write another test here for random number when no key entered
  end

  def test_does_message_decrypt

    enigma = Enigma.new
    assert enigma.decrypt("keder ohulw", "02715", "040895").is_a?(Hash)
  end

  def test_find_keys

    enigma = Enigma.new
    expected = {A: 02, B: 27, C: 71, D: 15}
    assert_equal expected, enigma.find_keys("02715")
  end

  def test_find_offset

    enigma = Enigma.new
    expected = {A: 1, B: 0, C: 2, D: 5}
    assert_equal expected, enigma.find_offset("040895")
  end

  def test_keys_with_offset

    enigma = Enigma.new
    expected = {A: 03, B: 27, C: 73, D: 20}
    assert_equal expected, enigma.keys_with_offset("02715", "040895")
  end

  def test_index_list

    enigma = Enigma.new
    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
    assert_equal expected, enigma.index_list("hello world")
  end

  def test_does_offset_keys_add_to_index_list_by_value_amount

    enigma = Enigma.new
    expected = [10, 31, 84, 31, 17, 53, 95, 34, 20, 38, 76]
    assert_equal expected, enigma.add_key_value_to_index("hello world", "02715", "040895")
  end

  def test_return_encrypted_message

    enigma = Enigma.new
    assert_equal "keder ohulw", enigma.return_encrypted_message([10, 31, 84, 31, 17, 53, 95, 34, 20, 38, 76])
  end

end
