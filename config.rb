module Config
    CONFIG = {
        path: "..",
        tab_space: 4,
        default_gems: ["pry", "rspec"],
        project_type: "sinatra",
        git_setup: {
            make_first_commit?: false,
            first_commit_message: "Create initial files and folders"
        }
    }
end

#path -> location file will be created in (MUST USE RELATIVE)
#tab_length -> indentation space for each new line
#default_gems -> gems will always be installed, regardless of project type
#project_type -> basic/sinatra ::: different gems/files depending on type
