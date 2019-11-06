class Enigma

            #message, key = random generate method, date = todays date
  def encrypt(message, a_key = random_key, a_date = Date.today.strftime('%m%d%y'))
    #insert method that returns encrypted message
    { encryption: message, key: a_key, date: a_date }
  end

  def random_key
    rand 99999
  end


end
