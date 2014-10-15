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

  def index
    quotes = FileModel.all

    render :index, :quotes => quotes
  end

  def show
    quote_1 = FileModel.find(params['id'])
    ua    = request.user_agent
    render_response :quote, :obj => quote_1, :ua => ua
  end

  def new_quote
    attrs = {
      "submitter"    => "web user",
      "quote"        => "A picture is worth one k pixels",
      "attribution"  => "Me"
    }

    m = FileModel.create attrs

    render :quote, :obj => m
  end

  def update_quote
    #quote_1 = FileModel.find(1)

    #quote_1.hash[:]
  end
end
