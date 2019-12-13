class SetupWizard
    def create_new(proj_name, path)
        @proj_name = proj_name.downcase().strip.gsub(/\s+/,"_").gsub(/\W/, "")
        @proj_path = "#{CONFIG[:path]}/#{@proj_name}"
        system "mkdir #{@proj_path}"
        system "mkdir #{@proj_path}/lib #{@proj_path}/spec"
    end

    def write_gems(proj_gems, default_gems)
        @proj_gems = make_array(proj_gems)
        default_gems.each {|gem| @proj_gems.push(gem)}

        File.write("../#{@proj_name}/Gemfile", "hello")
    end

    def make_array(str)
        str.downcase().strip.split(/[\/ .,]+/)
    end
end
