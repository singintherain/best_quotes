#run proc {
  #[200, {'Content-Type' => 'text/html'},
    #["Hello, world!"]]
#}
#
#require './config/application'

#run BestQuotes::Application.new
#
#use Rack::Auth::Basic, 'app' do |_, pass|
  #puts _
  #puts pass

  #'secret' == pass
#end

#run proc {
 #[200, {'Content-Type' => 'text/html'}, ["Hello, world"]]
#}
#

#class MiddleWare1
  #def initialize(app)
    #@app = app
  #end

  #def call(env)
    #status, headers, content = @app.call(env)
    ##content[0] += @arg + ', eh?'
    #puts 'MiddleWare1'
    #[status, headers, content]
  #end
#end

#use MiddleWare1

#class Canadianize
  #def initialize(app, arg = '')
    #@app = app
    #@arg = arg
  #end

  #def call(env)
    #status, headers, content = @app.call(env)
    #content[0] += @arg + ', eh?'
    #puts content.to_s
    #[status, headers, content]
  #end
#end

#use Canadianize, ", simple"

#class MiddleWare1
  #def initialize(app)
    #@app = app
  #end

  #def call(env)
    ##content[0] += @arg + ', eh?'
    #puts 'MiddleWare1'
    #status, headers, content = @app.call(env)
    #content[0] += ', eh?'
    #puts content.to_s
    #[status, headers, content]
  #end
#end

##use MiddleWare1

#class MiddleWare2
  #def initialize(app)
    #@app = app
  #end

  #def call(env)
    ##content[0] += @arg + ', eh?'
    #puts 'MiddleWare2'
    #status, headers, content = @app.call(env)
    ##content[0] += @arg + ', eh?'
    #content[0] += ' middleware2'
    #puts content.to_s
    #[status, headers, content]
  #end
#end

#use MiddleWare2

#use MiddleWare1

#use MiddleWare2

#use MiddleWare1
#run proc {
  #puts 'proc'
  #[200, {'Content-Type' => 'text/html'}, ["Hello, world"]]
#}

#infinity = Proc.new {|env| [200, {'Content-Type' => 'text/html'}, ["Hello, world"]]}

#builder = Rack::Builder.new do
  #use Rack::CommonLogger
  #run infinity
#end

#Rack::Handler::WEBrick.run builder, :Port => 3000

#require 'rack/lobster'

#use Rack::ContentType

#map '/lobster' do
  #use Rack::ShowExceptions
  #run Rack::Lobster.new
#end

#map '/lobster/but_not' do
  #run proc {
  #[200, {}, ['Really not a lobster']]
  #}
#end

#run proc {
  #[200, {}, ['Not a lobster']]
#}
#
#require 'rack/lobster'

#use Rack::ContentType

#class BenchMarker
  #def initialize(app, runs = 100)
    #@app, @runs = app, runs
  #end

  #def call(env)
    #t = Time.now

    #result = nil
    #@runs.times { result = @app.call(env) }

    #t2 = Time.now - t
    #STDERR.puts %Q|
      #Benchmark:
        ##{@runs} runs
        ##{t2.to_f} seconds total
        ##{t2.to_f * 1000.0 / @runs} millisec/run
    #|

    #result
  #end
#end

#use BenchMarker, 10_000

#run Rack::Lobster.new

require './config/application'

map '/' do
  run QuotesController.action(:index)
end

run BestQuotes::Application.new

