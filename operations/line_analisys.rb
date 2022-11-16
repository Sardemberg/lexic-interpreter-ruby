require_relative 'sentences/print'

module Operations
  class LineAnalisys
    def initialize(line, number_line)
      @line = line
      @number_line = number_line
      @errors = []
      @sentences = []
      @default_sentences = ['for', 'print', 'var']
    end

    def process
      remove_empty_caracters
      identify_sentences
      identify_errors
    end

    private

    def remove_empty_caracters
      @line = @line.gsub("\n", '')
      @line = @line.gsub(" ", '')
    end

    def identify_sentences
      @default_sentences.map do |sentence|
        next unless @line.include?(sentence)

        @sentences << {
          sentence: sentence,
          line: @number_line,
          value: @line
        }
      end
    end

    def identify_errors
      @sentences.each do |sentence|
        if sentence[:sentence] == 'print'
          value = Operations::Sentences::Print.new(sentence[:value]).process
          if value.values.include? false
            p("Erro na linha: #{sentence[:line]}")
          end
        end
      end
    end
  end
end
