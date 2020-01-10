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
#     arr = str.scan(/[A-Z][A-Za-z]+(?> ?\([A-Za-z@.#, ]*\))?/)
#     arr.reduce({}) do |acc, elem|
#         key = elem.scan(/[A-Z][a-z]+/)[0]
#         val = {
#             in_vars: elem.scan(/\@[a-z]+/).map {|e| e.delete('@')},
#             in_meths: elem.scan(/\#[a-z]+/).map {|e| e.delete('#')},
#             cl_vars: elem.scan(/\@\@[a-z]+/).map {|e| e.delete('@')},
#             cl_meths: elem.scan(/\.[a-z]+/).map {|e| e.delete('.')}
#         }
#         acc[key] = val
#         acc
#     end
# end
#
# puts ''
# read_classes('Album (@stuff, .morestuff, #stuff, @@moststuff), Song, Test(), MoreTest (), SecondLastTest(@somestuff), LastTest').each do |res|
#     puts res
#     puts ''
# end
