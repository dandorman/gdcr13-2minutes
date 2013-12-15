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
  it 'should have a cell alive that was seeded' do
    board = Board.new([[0,0]])
    board.cell_is_alive?([0,0]).should eq(true)
  end
  it 'should count living cells from a list of locations' do
    board = Board.new([[0,0]])
    board.count_living_cells([[0,0]]).should eq(1)
  end
  it 'should have eight relative neighbors' do
    board = Board.new
    board.rel_neighbors.count.should eq(8)
  end
  it 'should have eight relative neighbors' do
    board = Board.new
    board.cell_get_neighbors([0,0]).count.should eq(8)
  end
  it 'should count living relative neighbors' do
    board = Board.new([[0, 0], [0, 1]])
    neighbors = board.cell_get_neighbors([0, 0])
    board.count_living_cells(neighbors).should eq 1
  end
  it 'should kill a single cell after one generation' do
    board = Board.new([[0, 0]])
    board.generate
    board.cell_is_alive?([0, 0]).should be_false
  end
  it 'should keep a single cell with 2 neighbors' do
    board = Board.new([[-1, -1], [0, 0], [1, 1]])
    board.generate
    board.cells.should eq [[0, 0]]
  end
  it 'should birth a new cell from a dead cell w/3 neighbors' do
    board = Board.new([[-1, 1], [1, 1], [1, -1]])
    board.generate
    board.cells.should eq [[0, 0]]
  end

  it 'should handle a spinner' do
    board = Board.new([[0, -1], [0, 0], [0, 1]])
    2.times { board.generate }
    board.cells.should =~ [[0, -1], [0, 0], [0, 1]]
  end

  it 'should handle a stable square' do
    cells = [[0, 0], [1, 0],
             [0, 1], [1, 1]]
    board = Board.new(cells)
    2.times { board.generate }
    board.cells.should =~ cells
  end

  it 'should be able to tell whether a living cell with no neighbors will survive' do
    board = Board.new([[0, 0]])
    board.cell_will_live?([0, 0]).should be_false
  end

  it 'should be able to tell whether a living cell with 2 neighbors will survive' do
    board = Board.new([[-1, -1], [0, 0], [1, 1]])
    board.cell_will_live?([0, 0]).should be_true
  end

  it 'should be able to tell whether a dead cell with 2 neighbors will survive' do
    board = Board.new([[-1, 1], [1, 1]])
    board.cell_will_live?([0, 0]).should be_false
  end

  it 'should be able to tell whether a dead cell with 3 neighbors will survive' do
    board = Board.new([[-1, 1], [1, 1], [1, -1]])
    board.cell_will_live?([0, 0]).should be_true
  end
end
