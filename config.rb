module Config
    CONFIG = {
        path: "..",
        tab_length: 4,
        default_gems: ["pry", "rspec"],
        project_type: "sinatra"
    }
end

#path -> location file will be created in (MUST USE RELATIVE)
#tab_length -> indentation space for each new line
#default_gems -> gems will always be installed, regardless of project type
#project_type -> basic/sinatra/custom ::: different gems/files depending on type
