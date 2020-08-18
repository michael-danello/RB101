def transpose(matrix)
  transposed = []
  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |el, idx|
      transposed[idx] == nil ? transposed[idx] = [el] : transposed[idx] << el
    end
  end
  transposed
end

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

def rotate90(matrix)
  transpose(matrix).map{|row| row.reverse}
end
