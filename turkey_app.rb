require 'sinatra/base'
require 'pry'
require 'slim'
require_relative 'turkey'

class TurkeyApp < Sinatra::Base


  get '/' do
    slim :form
  end

  get '/turkeys' do
    done = Turkey::done_by(params[:time], params[:weight].to_f)
    "#{done}"
  end

  post '/turkey' do
    puts params
    done = Turkey::done_by(params[:time], params[:weight].to_f,offset = params[:offset])
    @done = done.strftime("%m/%d/%Y %I:%M:%S %p UTC")
    slim :time
  end

  get '/test' do
    "#{Turkey::done_by('7pm', 21.5)}"
  end
end


