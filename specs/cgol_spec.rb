require_relative '../cgol'

describe Board do
    it 'should pass' do
        true.should eq(true)
    end
    it 'should have an array of cells, even if no elements' do
        board = Board.new
        board.cells.count.should eq(0)
    end
end


