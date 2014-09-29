class QuotesController < Rulers::Controller

  def a_quote
    # rerun
    #'There is nothing either good or bad' + 
      #'but thinking makes it so' + 
      #"\n<pre>\n#{env}\n</pre>"
      render :a_quote, :noun => :winking
  end

  def exception
    raise "It's a bad one!"
  end

  def quote_1
    quote_1 = FileModel.find(1)

    render :quote, :obj => quote_1
  end
end
