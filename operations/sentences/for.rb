require_relative '../utils/stack'

module Operations
    module Sentences
        class For
            def initialize(sentence)
                @sentence = sentence
                @stack = Operations::Utils::Stack.new(["for", ' i ', ' in ', 'range', '(', ')', ':'])
                @result = true
            end
        
            def process
                until @stack.empty
                    caracter = @stack.pop
                    @result = false unless @sentence.include?(caracter)
                    @sentence = @sentence.sub(caracter, '')
                end
        
                @result
            end
        end
    end
end