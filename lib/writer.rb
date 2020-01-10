module Writer
    TAB =  " " * (CONFIG[:tab_space] || 4)

    def write_layout
        title = @proj_name.split("_").map(&:capitalize).join(" ")
        File.open("#{@proj_path}/views/layout.erb", "w+") do |ln|
            ln.puts "<!DOCTYPE html>"
            ln.puts "<html>"
            ln.puts "#{TAB}<head>"
            ln.puts "#{TAB * 2}<title>#{title}</title>"
            ln.puts "#{TAB}</head>"
            ln.puts "#{TAB}<body>"
            ln.puts "#{TAB * 2}<%= yield %>"
            ln.puts "#{TAB}</body>"
            ln.puts "</html>"
        end
    end

    def write_app
        File.open("#{@proj_path}/app.rb", "w+") do |ln|
            ln.puts "require \'sinatra\'"
            ln.puts "require \'sinatra/reloader\'"
            ln.puts "require \'./lib/*\'"
            ln.puts "require \'pry\'"
            ln.puts "also_reload \'lib/**/*.rb\'"
            ln.puts ""
            ln.puts "get \'/\' do"
            ln.puts "end"
        end
    end

    def write_gemfile(gems)
        File.open("#{@proj_path}/Gemfile", "w+") do |ln|
            ln.puts "source 'https://rubygems.org'"
            ln.puts ""
            gems.each { |gem| ln.puts "gem '#{gem}'" }
        end
    end

    def write_lib(user_class)
        # system "touch #{@proj_path}/lib/#{user_class}.rb"
        File.open("#{@proj_path}/lib/#{user_class}.rb", "w+") do |ln|
            ln.puts "class #{user_class.capitalize}"
            ln.puts "end"
        end
    end

    def write_spec(user_class)
        # system "touch #{@proj_path}/spec/#{user_class}.rb"
        File.open("#{@proj_path}/spec/#{user_class}_spec.rb", "w+") do |ln|
            ln.puts "require \'rspec\'"
            ln.puts "require \'#{user_class}\'"
            ln.puts ""
            ln.puts "describe \'#{user_class.capitalize}\' do"
            ln.puts "#{TAB}describe('#') do"
            ln.puts "#{TAB}end"
            ln.puts "end"
        end
    end
end
