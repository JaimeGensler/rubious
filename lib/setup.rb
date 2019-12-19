require './config.rb'
require './lib/assets.rb'
require './lib/writer.rb'

class SetupWizard
    include Config
    include Assets
    include Writer

    def new_project(proj_name)
        @proj_name = proj_name.downcase.strip.gsub(/\s+/,"_").gsub(/\W/, "")
        @proj_path = "#{CONFIG[:path] || ".."}/#{@proj_name}"
        system "mkdir #{@proj_path}"
        system "mkdir #{@proj_path}/lib #{@proj_path}/spec #{@proj_path}/views #{@proj_path}/public"
    end

    def setup_gems(add_gems)
        @proj_gems = (CONFIG[:default_gems] || []) + make_array(add_gems)
        write_gemfile(@proj_gems)
        # //something like this needs to happen for windows:
        # system "gem install --install-dir #{@proj_path} bundler"
        system "bundle install --gemfile=#{@proj_path}/Gemfile"
    end

    def setup_classes(proj_classes)
        @proj_classes = make_array(proj_classes)
        @proj_classes.each do |user_class|
            write_lib(user_class)
            write_spec(user_class)
        end
    end

    def open_project
        system "atom #{@proj_path}"
    end

    private
    NA = ["NA", "na", "none", "nothing", "nil", nil]
    def make_array(str)
        str.downcase.strip.split(/[\/ .,-]+/).uniq.reject {|e| NA.include? e}
    end
end
