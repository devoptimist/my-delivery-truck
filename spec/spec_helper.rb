# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'
ChefSpec::Coverage.start!

shared_context 'chef run' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform_details)
    runner.converge(described_recipe)
  end
end

shared_examples 'converges successfully' do
  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end
end
