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
    def count_living_cells(locations)
        (locations.select {|location| cell_is_alive? location}).size
    end
end
