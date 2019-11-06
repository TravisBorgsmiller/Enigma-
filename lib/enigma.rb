class Enigma

  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, a_key = "", a_date = Date.today.strftime('%m%d%y'))
    { encryption: message, key: random_key(a_key), date: a_date }
  end

  def random_key(number)
    if number.length > 0
      number.to_s.rjust(5, "0")
    else
      rand 99999
    end
  end

  def decrypt(message, a_key, a_date = Date.today.strftime('%m%d%y'))
    { decryption: message, key: a_key, date: a_date }
  end

  def find_keys(key)
    keys_hash = {}
    keys_hash[:A] = key.chars[0..1].join.to_i
    keys_hash[:B] = key.chars[1..2].join.to_i
    keys_hash[:C] = key.chars[2..3].join.to_i
    keys_hash[:D] = key.chars[3..4].join.to_i
    keys_hash
  end

  def find_offset(date)
    squared_number = date.to_i * date.to_i
    date_hash = {}
    date_hash[:A] = squared_number.to_s.chars[-4].to_i
    date_hash[:B] = squared_number.to_s.chars[-3].to_i
    date_hash[:C] = squared_number.to_s.chars[-2].to_i
    date_hash[:D] = squared_number.to_s.chars[-1].to_i
    date_hash
  end

  def keys_with_offset(key, date)
    new_key_with_offset = {}
    find_keys(key).each do |letter, number|
      find_offset(date).each do |date_letter, date_number|
        if date_letter == letter
          number += date_number
          new_key_with_offset[letter] = number
        end
      end
    end
    new_key_with_offset
  end

  def index_list(message)
    index_list = []
    broken_up = message.split('')
    broken_up.each do |message_letter|
      @alphabet.each.with_index do |letter, index|
        if message_letter == letter
          index_list << index
        end
      end
    end
    index_list
  end

  def add_key_value_to_index(message, key, date)
    new_index = index_list(message)
    new_keys = keys_with_offset(key, date)
    w = 0
    while w < new_index.length
      new_index[w] += new_keys[:A]
      w += 4
    end
    new_index
    x = 1
    while x < new_index.length
      new_index[x] += new_keys[:B]
      x += 4
    end
    new_index
    y = 2
    while y < new_index.length
      new_index[y] += new_keys[:C]
      y += 4
    end
    new_index
    z = 3
    while z < new_index.length
      new_index[z] += new_keys[:D]
      z += 4
    end
    new_index
    # return_encrypted_message(new_index)
  end

  def return_encrypted_message(new_index)
    message = []
      new_index.each do |number|
        @alphabet.each.with_index do |letter, index|
        if number == index
          then message << letter
        end
      end
    end
    message
  end

end
