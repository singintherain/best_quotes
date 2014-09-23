#run proc {
  #[200, {'Content-Type' => 'text/html'},
    #["Hello, world!"]]
#}
#
require './config/application'

run BestQuotes::Application.new
