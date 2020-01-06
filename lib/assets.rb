require 'colorize'
module Assets
    WELCOME = "                                   Welcome to                                   "
    SPACER = "                                                                                "
    TITLE = [
        "              ██████╗ ██╗   ██╗██████╗ ██╗ ██████╗ ██╗   ██╗███████╗            ",
        "              ██╔══██╗██║   ██║██╔══██╗██║██╔═══██╗██║   ██║██╔════╝            ",
        "              ██████╔╝██║   ██║██████╔╝██║██║   ██║██║   ██║███████╗            ",
        "              ██╔══██╗██║   ██║██╔══██╗██║██║   ██║██║   ██║╚════██║            ",
        "              ██║  ██║╚██████╔╝██████╔╝██║╚██████╔╝╚██████╔╝███████║            ",
        "              ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝            "
    ]
    BORDER = " °º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°` "

    def inject_header
        puts SPACER.on_black
        puts BORDER.colorize(:white).on_black
        puts WELCOME.colorize(:white).on_black
        TITLE.each{|ln| puts (ln.colorize(:red).on_black)}
        puts BORDER.colorize(:white).on_black
        puts SPACER.on_black
    end
end
