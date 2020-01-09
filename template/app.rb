<% if CONFIG[:project_type].downcase = 'sinatra'%>
require 'sinatra'
require 'sinatra/reloader'
<% %>
require './lib/*'
require 'pry'
also_reload 'lib/**/*.rb'

get '/' do
end
