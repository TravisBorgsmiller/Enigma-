class Enigma

            #message, key = random generate method, date = todays date
  def encrypt(message, a_key, a_date = Date.today.strftime('%m%d%y'))
    #insert method that returns encrypted message
    { encryption: message, key: a_key, date: a_date }
  end

  def random_key
    #code goes here 
  end


end
