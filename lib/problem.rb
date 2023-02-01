# frozen_string_literal: true

class Problem
  def initialize(file)
    @input = File.readlines(file).map { |line| line.strip.split(' ') }
    @directory = [{ name: '/', parent: nil, children: [], size: 0 }]
    @current_dir = 0
  end

  def add_size(size, base)
    return if base.nil?

    @directory[base][:size] += size
    add_size(size, @directory[base][:parent])
  end

  def calculate_size
    @input.each do |input|
      case input[0]
      when '$'
        if input[1] == 'cd'
          new_dir = input[2]
          case new_dir
          when '..'
            @current_dir = @directory[@current_dir][:parent]
          else
            @directory.push({ name: new_dir, parent: @current_dir, children: [], size: 0 })
            @directory[@current_dir][:children].push(@directory.length - 1)
            @current_dir = @directory.length - 1
          end
        end
      else
        add_size(input[0].to_i, @current_dir) if input[0] != 'dir'
      end
    end

    @directory.map { |d| d[:size] }.select { |s| s <= 100_000 }.sum
  end
end