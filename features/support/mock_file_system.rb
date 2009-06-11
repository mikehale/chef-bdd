module MockFileSystem

  def mock_dir(path)
    # Make sure any calls we don't care about get to the actual filesystem.
    stub.proxy(File).directory? { |result| result }
    stub.proxy(File).exist? { |result| result }
    stub.proxy(File).stat { |result| result }

    mock(Dir).mkdir(path).at_least(1) { 0 }
    mock(File) do |f|
      f.exist?(path).times(any_times) { true }
      f.directory?(path).times(any_times) { true }
      f.stat(path).times(any_times) { mock_stats }
    end
    
  end
  
  def mock_stats
    stub(stats = Object.new)
    stub(stats).uid { 500 }
    stub(stats).gid { 500 }
    stub(stats).mode { 0755 }
    stats
  end
  
end

World(MockFileSystem)