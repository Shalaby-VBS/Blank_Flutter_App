#!/usr/bin/env ruby
require 'xcodeproj'

# Open the Xcode project
project_path = 'Runner.xcodeproj'
project = Xcodeproj::Project.open(project_path)

# Get the main target
target = project.targets.first

# Create Development and Production configurations
['Development', 'Production'].each do |flavor|
  ['Debug', 'Release'].each do |config_type|
    config_name = "#{flavor}-#{config_type}"

    # Check if configuration already exists
    unless project.build_configurations.find { |c| c.name == config_name }
      # Create new configuration based on Debug or Release
      base_config = project.build_configurations.find { |c| c.name == config_type }
      new_config = project.add_build_configuration(config_name, config_type.downcase.to_sym)

      # Copy settings from base configuration
      new_config.build_settings = base_config.build_settings.dup
    end
  end
end

# Create schemes for each flavor
['Development', 'Production'].each do |flavor|
  scheme_name = "Runner-#{flavor}"
  scheme = Xcodeproj::XCScheme.new

  # Build action
  scheme.add_build_target(target)
  scheme.set_launch_target(target)

  # Set build configuration for launch
  scheme.launch_action.build_configuration = "#{flavor}-Debug"
  scheme.test_action.build_configuration = "#{flavor}-Debug"
  scheme.profile_action.build_configuration = "#{flavor}-Release"
  scheme.analyze_action.build_configuration = "#{flavor}-Debug"
  scheme.archive_action.build_configuration = "#{flavor}-Release"

  # Save scheme
  scheme.save_as(project_path, scheme_name)
end

# Save the project
project.save

puts "✅ iOS flavors configured successfully!"
puts "Created configurations: Development-Debug, Development-Release, Production-Debug, Production-Release"
puts "Created schemes: Runner-Development, Runner-Production"
