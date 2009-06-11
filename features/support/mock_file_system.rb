module MockFileSystem

  def mock_dir(path)
    stub.proxy(File).directory? { |result| result }
    stub.proxy(File).exist? { |result| result }
    stub.proxy(File).stat { |result| result }

    mock(Dir).mkdir(path).at_least(1) {0}
    mock(File).exist?(path).times(any_times) {true}
    mock(File).directory?(path).times(any_times) {true}
    stub(cstats = Object.new)
    stub(cstats).uid {500}
    stub(cstats).gid {500}
    stub(cstats).mode {0755}
    mock(File).stat(path).times(any_times) {cstats}
  end
  
end

World(MockFileSystem)