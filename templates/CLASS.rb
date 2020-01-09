class ClassName
    attr_reader :attr
    attr_writer :attr
    attr_accessor :attr
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

# [A-Z][A-Za-z_]+( ?\([A-Za-z@.#, ]*\))?
