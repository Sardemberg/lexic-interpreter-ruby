require_relative '../utils/stack'

module Operations
  module Sentences
    class Print
      def initialize(sentence)
        @sentence = sentence
        @stack = Operations::Utils::Stack.new("print('')".split(''))
        @validation = {}
      end

      def process
        until @stack.empty
          caracter = @stack.pop

          @validation[caracter] = false
          @validation[caracter] = true if @sentence.include?(caracter)
        end

        @validation
      end
    end
  end
end
