# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/console/marker'

describe Marker do
  before do
    @markers = Marker.new
  end

  describe ' #x' do
    it 'should return X' do
      actual = @markers.x
      expect(actual).to eq('X')
    end
  end

  describe ' #o' do
    it 'should return O' do
      actual = @markers.o
      expect(actual).to eq('O')
    end
  end
end
