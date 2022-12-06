require_relative '../utils/stack'

module Operations
    module Sentences
        class While
            def initialize(sentence)
                @sentence = sentence
                @stack = Operations::Utils::Stack.new("while :".split(" "))
                @optional_structs = ["==", ">=", "<=", "!=", "not", " > ", " < "]
                @result = true
            end


            def process
                until @stack.empty
                    caracter = @stack.pop
                    @result = false unless @sentence.include?(caracter)
                    @sentence = @sentence.sub(caracter, '')
                end
                
                optional_structs_contains = false

                @optional_structs.each do |struct|
                    optional_structs_contains = true if @sentence.include?(struct)
                end
        
                return true if @result && optional_structs_contains
                return false
            end
        end
    end
end