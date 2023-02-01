# frozen_string_literal: true

require 'problem'

describe 'Part 1 - Example' do
  it 'returns the correct result' do
    example_input = 'files/example.txt'
    expect(Problem.new(example_input).calculate_size).to eq(95_437)
  end
end

describe 'Part 1 - Real Input' do
  it 'returns the correct result' do
    real_input = 'files/real_problem.txt'
    expect(Problem.new(real_input).calculate_size).to eq(1_989_474)
  end
end
