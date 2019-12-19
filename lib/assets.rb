require 'colorize'
module Assets
    TITLE = [
        "              ██████╗ ██╗   ██╗██████╗ ██╗ ██████╗ ██╗   ██╗███████╗            ",
        "              ██╔══██╗██║   ██║██╔══██╗██║██╔═══██╗██║   ██║██╔════╝            ",
        "              ██████╔╝██║   ██║██████╔╝██║██║   ██║██║   ██║███████╗            ",
        "              ██╔══██╗██║   ██║██╔══██╗██║██║   ██║██║   ██║╚════██║            ",
        "              ██║  ██║╚██████╔╝██████╔╝██║╚██████╔╝╚██████╔╝███████║            ",
        "              ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝            "
    ]
    BORDER = " °º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°` "
    SPACER = "                                                                                "
    WELCOME = "                                   Welcome to                                   "

    def inject_header
        puts SPACER.on_black
        puts BORDER.colorize(:white).on_black
        puts WELCOME.colorize(:white).on_black
        TITLE.each{|ln| puts (ln.colorize(:red).on_black)}
        puts BORDER.colorize(:white).on_black
        puts SPACER.on_black
    end
end
