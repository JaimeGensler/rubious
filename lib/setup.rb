require './config.rb'
require './lib/assets.rb'

class SetupWizard
    include Assets
    include Config

    def create_new(proj_name)
        @proj_name = proj_name.downcase.strip.gsub(/\s+/,"_").gsub(/\W/, "")
        @proj_path = "#{CONFIG[:path]}/#{@proj_name}"
        system "mkdir #{@proj_path}"
        system "mkdir #{@proj_path}/lib #{@proj_path}/spec #{@proj_path}/views #{@proj_path}/public"
    end

    def get_gems(proj_gems)
        @proj_gems = CONFIG[:default_gems] + make_array(proj_gems)

        File.open("#{@proj_path}/Gemfile", "w+") do |f|
            f.puts("source 'https://rubygems.org'\n\n")
            @proj_gems.each { |gem| f.puts("gem '#{gem}'") }
        end
        # system "gem install --install-dir #{@proj_path} bundler"
        system "bundle install --gemfile=#{@proj_path}/Gemfile"
    end

    def make_classes(proj_classes)
        @proj_classes = make_array(proj_classes)
        @proj_classes.each do |user_class|
            File.write("#{@proj_path}/lib/#{user_class}.rb", "class #{user_class.capitalize}\nend")
            File.write("#{@proj_path}/spec/#{user_class}_spec.rb", "require \'rspec\'\nrequire \'#{user_class}\'\n\ndescribe \'#{user_class.capitalize}\' do\n    describe('#') do\n    end\nend")
        end
    end

    def open_project
        system "atom #{@proj_path}"
    end

    private
    def make_array(str)
        str.downcase().strip.split(/[\/ .,]+/)
    end
end
