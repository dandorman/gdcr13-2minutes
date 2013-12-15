class Board
  attr_accessor :cells
  attr_accessor :rel_neighbors

  def initialize(seed = [])
    @cells = seed
    @rel_neighbors = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,0],[1,-1],[1,1]]
  end

  def cell_is_alive?(location)
    @cells.include? location
  end

  def cell_get_neighbors(location)
    @rel_neighbors.map {|delta| [location[0] + delta[0], location[1] + delta[1]]}
  end

  def count_living_cells(locations)
    (locations.select {|location| cell_is_alive? location}).size
  end

  LIVING_RULES = { 0 => false, 1 => false, 2 => true, 3 => true, 4 => true, 5 => false, 6 => false, 7 => false, 8 => false }
  DEAD_RULES = LIVING_RULES.merge(2 => false)
  RULES = { true => LIVING_RULES, false => DEAD_RULES }

  def cell_will_live?(location)
    neighbors = cell_get_neighbors(location)
    RULES[cell_is_alive?(location)][count_living_cells(neighbors)]
  end

  def generate
    candidates = @cells.flat_map { |cell| cell_get_neighbors(cell) }
    candidates += @cells
    candidates.uniq!
    @cells = candidates.select { |cell| cell_will_live?(cell) }
    self
  end
end
