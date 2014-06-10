require './spec/spec_helper'

describe Service::Group do

  let(:path) { Dir.pwd + '/spec/fixtures/services' }

  class StubService
    include Celluloid
    attr_reader :started
    attr_accessor :file_path

    def initialize(path)
      @file_path = path
    end

    def start
      @started = true
    end
  end
  
  it 'start all services on the pool' do
    group = Service::Group.new(path: path, clazz: StubService)
    group.init
    expect(group.supervisor.actors.first.started).to be_true 
  end

end
