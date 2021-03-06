# frozen_string_literal: true

RSpec.describe 'Predicates: Even' do
  context 'with required' do
    subject(:schema) do
      Dry::Schema.define do
        required(:foo) { even? }
      end
    end

    context 'with even input' do
      let(:input) { { foo: 2 } }

      it 'is successful' do
        expect(result).to be_successful
      end
    end

    context 'with missing input' do
      let(:input) { {} }

      it 'is not successful' do
        expect(result).to be_failing ['is missing', 'must be even']
      end
    end

    context 'with nil input' do
      let(:input) { { foo: nil } }

      it 'raises error' do
        expect { result }.to raise_error(NoMethodError)
      end
    end

    context 'with blank input' do
      let(:input) { { foo: '' } }

      it 'raises error' do
        expect { result }.to raise_error(NoMethodError)
      end
    end

    context 'with invalid input type' do
      let(:input) { { foo: [] } }

      it 'raises error' do
        expect { result }.to raise_error(NoMethodError)
      end
    end

    context 'with odd input' do
      let(:input) { { foo: 1 } }

      it 'is not successful' do
        expect(result).to be_failing ['must be even']
      end
    end
  end

  context 'with optional' do
    subject(:schema) do
      Dry::Schema.define do
        optional(:foo) { even? }
      end
    end

    context 'with even input' do
      let(:input) { { foo: 2 } }

      it 'is successful' do
        expect(result).to be_successful
      end
    end

    context 'with missing input' do
      let(:input) { {} }

      it 'is successful' do
        expect(result).to be_successful
      end
    end

    context 'with nil input' do
      let(:input) { { foo: nil } }

      it 'raises error' do
        expect { result }.to raise_error(NoMethodError)
      end
    end

    context 'with blank input' do
      let(:input) { { foo: '' } }

      it 'raises error' do
        expect { result }.to raise_error(NoMethodError)
      end
    end

    context 'with invalid input type' do
      let(:input) { { foo: [] } }

      it 'raises error' do
        expect { result }.to raise_error(NoMethodError)
      end
    end

    context 'with odd input' do
      let(:input) { { foo: 1 } }

      it 'is not successful' do
        expect(result).to be_failing ['must be even']
      end
    end
  end

  context 'as macro' do
    context 'with required' do
      context 'with value' do
        subject(:schema) do
          Dry::Schema.define do
            required(:foo).value(:even?)
          end
        end

        context 'with valid input' do
          let(:input) { { foo: 2 } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            expect(result).to be_failing ['is missing', 'must be even']
          end
        end

        context 'with nil input' do
          let(:input) { { foo: nil } }

          it 'raises error' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with blank input' do
          let(:input) { { foo: '' } }

          it 'raises error' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with invalid input type' do
          let(:input) { { foo: [] } }

          it 'raises error' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with odd input' do
          let(:input) { { foo: 1 } }

          it 'is not successful' do
            expect(result).to be_failing ['must be even']
          end
        end
      end

      context 'with filled' do
        subject(:schema) do
          Dry::Schema.define do
            required(:foo).filled(:even?)
          end
        end

        context 'with even input' do
          let(:input) { { foo: 2 } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            expect(result).to be_failing ['is missing', 'must be even']
          end
        end

        context 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be even']
          end
        end

        context 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be even']
          end
        end

        context 'with invalid input type' do
          let(:input) { { foo: [] } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be even']
          end
        end

        context 'with odd input' do
          let(:input) { { foo: 1 } }

          it 'is not successful' do
            expect(result).to be_failing ['must be even']
          end
        end
      end

      context 'with maybe' do
        subject(:schema) do
          Dry::Schema.define do
            required(:foo).maybe(:even?)
          end
        end

        context 'with even input' do
          let(:input) { { foo: 2 } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            expect(result).to be_failing ['is missing', 'must be even']
          end
        end

        context 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is successful' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with invalid input type' do
          let(:input) { { foo: [] } }

          it 'raises error' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with odd input' do
          let(:input) { { foo: 1 } }

          it 'is not successful' do
            expect(result).to be_failing ['must be even']
          end
        end
      end
    end

    context 'with optional' do
      context 'with value' do
        subject(:schema) do
          Dry::Schema.define do
            optional(:foo).value(:even?)
          end
        end

        context 'with even input' do
          let(:input) { { foo: 2 } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with nil input' do
          let(:input) { { foo: nil } }

          it 'raises error' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with blank input' do
          let(:input) { { foo: '' } }

          it 'raises error' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with invalid input type' do
          let(:input) { { foo: [] } }

          it 'raises error' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with odd input' do
          let(:input) { { foo: 1 } }

          it 'is not successful' do
            expect(result).to be_failing ['must be even']
          end
        end
      end

      context 'with filled' do
        subject(:schema) do
          Dry::Schema.define do
            optional(:foo).filled(:even?)
          end
        end

        context 'with even input' do
          let(:input) { { foo: 2 } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be even']
          end
        end

        context 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be even']
          end
        end

        context 'with invalid input type' do
          let(:input) { { foo: [] } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be even']
          end
        end

        context 'with odd input' do
          let(:input) { { foo: 1 } }

          it 'is not successful' do
            expect(result).to be_failing ['must be even']
          end
        end
      end

      context 'with maybe' do
        subject(:schema) do
          Dry::Schema.define do
            optional(:foo).maybe(:even?)
          end
        end

        context 'with even input' do
          let(:input) { { foo: 2 } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is successful' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with invalid input type' do
          let(:input) { { foo: [] } }

          it 'raises error' do
            expect { result }.to raise_error(NoMethodError)
          end
        end

        context 'with odd input' do
          let(:input) { { foo: 1 } }

          it 'is not successful' do
            expect(result).to be_failing ['must be even']
          end
        end
      end
    end
  end
end
