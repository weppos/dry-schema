# frozen_string_literal: true

RSpec.shared_context 'predicate helper' do
  def p(name, *args)
    Dry::Logic::Rule::Predicate.new(predicates[name], args: args).to_ast
  end

  let!(:predicates) do
    Module.new {
      include Dry::Logic::Predicates

      def self.email?(_value)
        true
      end
    }
  end
end
