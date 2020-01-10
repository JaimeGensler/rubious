require './lib/assets.rb'
require './lib/writer.rb'

class SetupWizard
    include Assets
    include Writer
    CONFIG[:path].gsub!(/(\s)*(\/)\z/, "")

    def start(proj_name)
        @proj_name = proj_name.downcase.strip.gsub(/\s+/,"_").gsub(/\W/, "")
        @proj_path = "#{CONFIG[:path] || ".."}/#{@proj_name}"
    end
    def get_gems(new_gems)
        @proj_gems = (CONFIG[:default_gems] || []) + make_array(new_gems)
    end
    def get_classes(new_classes)
        @proj_classes = make_array(new_classes)
    end
    def finish
        system "mkdir #{@proj_path}"
        setup_type
        setup_gems
        setup_classes
        setup_git
        system "atom #{@proj_path}"
    end

    private

    def setup_type
        type = CONFIG[:project_type] || "basic"
        system "mkdir #{@proj_path}/lib #{@proj_path}/spec"
        if (type == "sinatra")
            system "mkdir #{@proj_path}/views #{@proj_path}/public"
            @proj_gems = (@proj_gems + ["sinatra", "sinatra-contrib", "capybara"]).uniq
            write_layout
            write_app
        end
    end
    def setup_gems
        write_gemfile(@proj_gems)
        system "bundle install --gemfile=#{@proj_path}/Gemfile"
    end
    def setup_classes
        @proj_classes.each do |user_class|
            write_lib(user_class)
            write_spec(user_class)
        end
    end
    def setup_git
        if (CONFIG[:git_instructions][:make_first_commit?])
            system "git init #{@proj_path}"
        end
    end

    NA = ["na", "none", "nothing", "nil", "n", "a"]
    def make_array(str)
        list = str.downcase.strip.split(/[\/, ]+/).uniq
        list.reject {|word| (NA.any? {|nul| /\A#{nul}\z/i.match? word}) }
    end

    def read_classes(str)
        arr = str.scan(/[A-Z][A-Za-z]+(?> ?\([A-Za-z@.#, ]*\))?/)
        arr.reduce({}) do |acc, elem|
            key = elem.scan(/[A-Z][a-z]+/)[0]
            val = {
                in_vars: elem.scan(/\@[a-z]+/).map {|e| e.delete('@')},
                cl_vars: elem.scan(/\@\@[a-z]+/).map {|e| e.delete('@')},
                in_meths: elem.scan(/\#[a-z]+/).map {|e| e.delete('#')},
                cl_meths: elem.scan(/\.[a-z]+/).map {|e| e.delete('.')}
            }
            acc[key] = val
            acc
        end
    end
end
