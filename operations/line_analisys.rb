require_relative 'sentences/print'
require_relative 'sentences/for'

module Operations
  class LineAnalisys
    def initialize(line, number_line)
      @line = line
      @number_line = number_line
      @errors = []
      @sentences = []
      @default_sentences = {
        'print': {
          operation: Operations::Sentences::Print
        },
        'for': {
          operation: Operations::Sentences::For
        },
        'var': nil,
        'if': nil
      }
    end

    def process
      remove_empty_caracters
      return if @line == ''

      identify_sentences
      identify_errors
      show_errors
    end

    private

    def remove_empty_caracters
      @line = @line.gsub("\n", '')
      @line = @line.gsub("\r", '')
      @line = @line.gsub(" ", '')
    end

    def identify_sentences
      has_include = false
      
      @default_sentences.keys.map(&:to_s).map do |sentence|
        next unless @line.include?(sentence)

        @sentences << {
          sentence: sentence,
          line: @number_line,
          value: @line
        }

        has_include = true
      end

      @errors << "Erro na linha: #{@number_line}, sentença inválida" unless has_include
    end

    def identify_errors
      @sentences.each do |sentence|
        default_sentence = @default_sentences[sentence[:sentence].to_sym]

        unless default_sentence.nil?
          operation = default_sentence[:operation]
          result = operation.new(sentence[:value]).process

          unless result
            @errors << "Erro na linha: #{sentence[:line]}, sentença #{sentence[:sentence].upcase} com erro de sintaxe"
          end
        end
      end
    end

    def show_errors
      @errors.each do |error|
        p error
      end
    end
  end
end
