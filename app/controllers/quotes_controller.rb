class QuotesController < Rulers::Controller

  def a_quote
    'There is nothing either good or bad' + 
      'but thinking makes it so' + 
      "\n<pre>\n#{env}\n</pre>"
  end

  def exception
    raise "It's a bad one!"
  end
end
