require_relative '../cgol'

describe Board do
    it 'should pass' do
        true.should eq(true)
    end
    it 'should have an array of cells, even if no elements' do
        board = Board.new
        board.cells.count.should eq(0)
    end
    it 'should accept a seed' do
        board = Board.new([[0,0]])
        board.cells.count.should eq(1)
    end
    it 'should have more than one cell if initialized with a seed' do
        board = Board.new([[0,0]])
        board.cells.count.should eq(1)
    end
end


