# using BFS to find way out of maze
# You task is to design an algorithms with breadth-first search
# that is able to find the shortest path from a given source to a given destination.
#
# The maze is represented by a two-dimensional list.
# [
#    [S, 1, 1, 1, 1],
#    [0, 1, 1, 1, 1],
#    [0, 0, 0, 0, 1],
#    [1, 0, 1, 1, 1],
#    [0, 0, 0, 1, D]
# ]
# (0,0) is the source
# (4,4) is the destination.
# 0 represents walls or obstacles
# 1 is the valid cells we can include in the solution.

class MazeSolver
  def initialize(matrix)
    @matrix = matrix
    @move_x = [1, 0, 0, -1]
    @move_y = [0, -1, 1, 0]

    # All values are nil by default (not visited)
    @visited = Array.new(@matrix.length) { Array.new(@matrix[0].length, false) }
    @min_dist = nil
  end

  def valid?(row, col)
    # Outside the maze Horizontally
    return false if row.negative? || row >= @matrix.length

    # Outside the maze Vertically
    return false if col.negative? || col >= @matrix[0].length

    # Detect Wall
    return false if @matrix[row][col].zero?

    # Already visited
    return false if @visited[row][col]

    true
  end

  def search(start_x, start_y, end_x, end_y)
    @visited[start_x][start_y] = true
    queue = []
    queue.unshift([start_x, start_y, 0])

    while queue
      start_x, start_y, dist = queue.pop

      # We found the destination
      if start_x == end_x && start_y == end_y
        @min_dist = dist
        break
      end

      (0...@move_x.length).each do |move|
        next_x = start_x + @move_x[move]
        next_y = start_y + @move_y[move]

        next unless valid?(next_x, next_y)

        @visited[next_x][next_y] = true
        queue.unshift([next_x, next_y, (dist + 1)])
      end

    end
  end

  def show_result
    if @min_dist.nil?
      puts 'No path was found'
    else
      puts "Sortest path is: #{@min_dist}"
    end
  end
end

maze = [
  [1, 1, 1, 1, 1],
  [0, 1, 1, 1, 1],
  [0, 0, 0, 0, 1],
  [1, 0, 1, 1, 1],
  [0, 0, 0, 1, 1]
]

maze_solver = MazeSolver.new(maze)
maze_solver.search(0, 0, 4, 4)
maze_solver.show_result
