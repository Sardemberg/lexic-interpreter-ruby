require_relative '../utils/stack'

module Operations
  module Sentences
    class Print
      def initialize(sentence)
        @sentence = sentence
        @stack = Operations::Utils::Stack.new("print('')".split(''))
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
