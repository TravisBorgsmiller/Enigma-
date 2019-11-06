class Enigma

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

end
