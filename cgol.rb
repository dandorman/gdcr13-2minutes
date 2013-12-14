class Board
    attr_accessor :cells
    def initialize(seed = [])
        @cells = seed
    end
    def cell_is_alive?(location)
        @cells.include? location
    end
    def count_living_cells(locations)
        (locations.select {|location| cell_is_alive? location}).size
    end
end
