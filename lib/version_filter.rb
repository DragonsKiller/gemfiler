class VersionFilter

  def initialize(versions, gem_version)
    @versions = versions
    @gem_version = gem_version
  end
  
  def filter
    begin
      @versions.map {|v| v if Gem::Dependency.new('', @gem_version).match?('', v)}
    rescue Gem::Requirement::BadRequirementError
      puts "Error. Check the way of writing gem version".red
    end
  end
end
