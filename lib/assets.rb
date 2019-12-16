module Assets
    HEADER = [
        "              ██████╗ ██╗   ██╗██████╗ ██╗ ██████╗ ██╗   ██╗███████╗            ",
        "              ██╔══██╗██║   ██║██╔══██╗██║██╔═══██╗██║   ██║██╔════╝            ",
        "              ██████╔╝██║   ██║██████╔╝██║██║   ██║██║   ██║███████╗            ",
        "              ██╔══██╗██║   ██║██╔══██╗██║██║   ██║██║   ██║╚════██║            ",
        "              ██║  ██║╚██████╔╝██████╔╝██║╚██████╔╝╚██████╔╝███████║            ",
        "              ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝            "
    ]
    BORDER = " °º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°` "
    SPACER = "                                   "

    def inject_header
        puts BORDER.colorize(:white).on_black
        puts (SPACER + "Welcome to" + SPACER).colorize(:white).on_black.blink
        HEADER.each{|ln| puts (ln.colorize(:red).on_black)}
        puts BORDER.colorize(:white).on_black
        puts "".colorize(:white).on_black
    end
end
