# frozen_string_literal: true

def read_data(filename)
  result = {}
  File.open filename do |file|
    file.readlines.each do |line|
      _, _, age = line.split
      age = age.to_i
      result[age] = [] unless result.key? age
      result[age] << line
    end
  end
  result
end

def save(filename, data, age)
  return unless data.key? age

  File.open(filename, 'a') do |file|
    data[age].each do |line|
      file.write line
    end
  end
end
