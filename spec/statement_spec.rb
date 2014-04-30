require_relative '../src/statement'

describe Statement do
  describe '#new' do
    context 'when initilized' do
      context 'with invalid statement' do
        it 'raises an error' do
          expect { Statement.new('foo') }.to raise_error(ArgumentError)
          expect { Statement.new('') }.to raise_error(ArgumentError)
          expect { Statement.new('1 + 1') }.to raise_error(ArgumentError)
        end
      end
      
      context 'with valid statement' do
        it 'does not raise an error' do
          expect { Statement.new(';') }.to_not raise_error
          expect { Statement.new('1 + 1;') }.to_not raise_error
        end
        
        it 'replaces line endings with spaces' do
          statement = Statement.new('\n;')
          statement.to_s.should eq(' ;')
         
          statement = Statement.new('\n\n;')
          statement.to_s.should eq('  ;')
        
          statement = Statement.new('1 +\n1\n;')
          statement.to_s.should eq('1 + 1 ;')
        end
        
        it 'replaces tabs with spaces' do
          statement = Statement.new('\t;')
          statement.to_s.should eq(' ;')
          
          statement = Statement.new('\t\t;')
          statement.to_s.should eq('  ;')
        
          statement = Statement.new('1 +\t1\t;')
          statement.to_s.should eq('1 + 1 ;')
        end
      end
    end
  end
end