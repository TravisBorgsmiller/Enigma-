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

end
