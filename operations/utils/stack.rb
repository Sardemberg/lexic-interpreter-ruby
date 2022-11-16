module Operations
  module Utils
    class Stack
      def initialize(sentence_array)
        @sentence_array = sentence_array
      end

      def pop
        @sentence_array.pop
      end

      def rest
        @sentence_array.count
      end

      def empty
        @sentence_array.count == 0
      end
    end
  end
end
