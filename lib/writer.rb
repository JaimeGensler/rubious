require './config.rb'

module Writer
    include Config
    TAB =  " " * (CONFIG[:tab_length] || 2)

    def write_gemfile(gems)
        f = File.open("#{@proj_path}/Gemfile", "w+") do |ln|
            ln.puts("source 'https://rubygems.org'")
            gems.each { |gem| ln.puts("gem '#{gem}'") }
        end
        f.close
    end

    def write_lib(user_class)
        f = File.open("#{@proj_path}/lib/#{user_class}.rb", "w+") do |ln|
            ln.puts "class #{user_class.capitalize}"
            ln.puts "end"
        end
        f.close
    end

    def write_spec(user_class)
        f = File.open("#{@proj_path}/lib/#{user_class}.rb", "w+") do |ln|
            ln.puts "require \'rspec\'"
            ln.puts "require \'#{user_class}\'"
            ln.puts ""
            ln.puts "describe \'#{user_class.capitalize}\' do"
            ln.puts "#{TAB}describe('#') do"
            ln.puts "#{TAB}end"
            ln.puts "end"
        end
        f.close
    end
end
