class Board
    attr_accessor :cells
    def initialize(seed = [])
        @cells = seed
    end
    def cell_is_alive?(location)
        @cells.include? location
    end
end
