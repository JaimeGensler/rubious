require 'rspec'
require 'pry'
require 'pg'
<% @project_classes.each do |proj_class|%>
require '<%= proj_class %>'
<% end %>

DB = PG.connect({:dbname => 'database'})

# RSpec.configure do |config|
#     config.after(:each) do
#         DB.exec "DELETE FROM theatres *;"
#         DB.exec "DELETE FROM movies *;"
#         DB.exec "DELETE FROM showings *;"
#     end
# end
