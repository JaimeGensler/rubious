class ClassName
    attr_reader :smth
    def initialize(attributes)
        @inst_var = attributes[:inst_var]
    end
    def inst_method
    end

    #class methods
    @@class_var = nil;

    def self.class_method
    end
end

# [A-Z][A-Za-z]+( ?\([A-Za-z@.#, ]*\))?
#
# puts 'Album (@stuff, .morestuff, #stuff, @@moststuff), Song, Test(), MoreTest (), SecondLastTest(@somestuff), LastTest'.scan(/[A-Z][A-Za-z]+(?> ?\([A-Za-z@.#, ]*\))?/)
#
# def read_classes(str)
#     arr = str.scan(/[A-Z][a-zA-Z]+(?> ?\([A-Za-z@.#, ]*\))?/)
#     arr.reduce({}) do |acc, elem|
#         key = elem.scan(/[A-Z][a-zA-Z]+/)[0]
#         acc[key] = {
#             in_vars: elem.scan(/[^@]\@[a-z]+/).map {|e| e.delete('@')},
#             cl_vars: elem.scan(/\@{2}[a-z]+/).map {|e| e.delete('@')},
#             in_meths: elem.scan(/\#[a-z]+/).map {|e| e.delete('#')},
#             cl_meths: elem.scan(/\.[a-z]+/).map {|e| e.delete('.')}
#         }
#         acc
#     end
# end
#
# puts ''
# read_classes('Album (@things, @thinging, .morestuff, #thingerinos, @@bigthings), Song, Test(), MoreTest (), SecondLastTest(@somestuff), LastTest').each do |res|
#     puts res
#     puts ''
# end
