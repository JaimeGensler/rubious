module Assets
    HEADER = [
        "         ██████╗ ██╗   ██╗██████╗ ██╗ ██████╗ ██╗   ██╗███████╗",
        "         ██╔══██╗██║   ██║██╔══██╗██║██╔═══██╗██║   ██║██╔════╝",
        "         ██████╔╝██║   ██║██████╔╝██║██║   ██║██║   ██║███████╗",
        "         ██╔══██╗██║   ██║██╔══██╗██║██║   ██║██║   ██║╚════██║",
        "         ██║  ██║╚██████╔╝██████╔╝██║╚██████╔╝╚██████╔╝███████║",
        "         ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝",
        ""
    ]

    def inject_header
        puts "  Welcome to"
        HEADER.each{|ln| puts (ln.colorize(:red))}
    end
end
