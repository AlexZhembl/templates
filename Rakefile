#!/usr/bin/rake

## [ Constants ] ##############################################################

WORKSPACE = 'Templates'
SCHEME_NAME = 'Tests'
CONFIGURATION = 'Debug'

desc 'Generate Test Output'
task :generate_output => "xcode:build" do |task|
  Utils.print_header 'Generating contexts...'
  Utils.run(%Q(xcodebuild -workspace "#{WORKSPACE}.xcworkspace" -scheme "Generate Output" -configuration "#{CONFIGURATION}" test-without-building), task, xcrun: true, formatter: :xcpretty)
end

## [ Output compilation ] #####################################################

MODULE_INPUT_PATH = 'Fixtures/stub-env/Modules'
MODULE_OUTPUT_PATH = 'Fixtures/stub-env'
SDKS = {
  :macosx => 'x86_64-apple-macosx10.12',
  :iphoneos => 'armv7s-apple-ios10.0',
  :watchos => 'armv7k-apple-watchos3.0',
  :appletvos => 'arm64-apple-tvos10.0'
}
TOOLCHAINS = {
  :swift3 => {
    :module_path => "#{MODULE_OUTPUT_PATH}/swift3",
    :toolchain => 'com.apple.dt.toolchain.XcodeDefault'
  }
}

namespace :output do
  desc 'Compile modules'
  task :modules do |task|
    Utils.print_header 'Compile output modules'

    # macOS
    modules = ['FadeSegue', 'PrefsWindowController']
    modules.each do |m|
      Utils.print_info "Compiling module #{m}… (macos)"
      compile_module(m, :macosx, task)
    end

    # iOS
    modules = ['CustomSegue', 'LocationPicker', 'SlackTextViewController']
    modules.each do |m|
      Utils.print_info "Compiling module #{m}… (ios)"
      compile_module(m, :iphoneos, task)
    end

    # delete swiftdoc
    Dir.glob("#{MODULE_OUTPUT_PATH}/*.swiftdoc").each do |f|
      FileUtils.rm_rf(f)
    end
  end

  desc 'Compile output'
  task :compile => :modules do |task|
    Utils.print_header 'Compiling template output files'

    exit Dir.glob('Tests/Expected/**/*.swift').map { |f|
      Utils.print_info "Compiling #{f}…\n"
      compile_file(f, task)
    }.reduce(true) { |result, status|
      result && status
    }
  end

  def compile_module(m, sdk, task)
    target = SDKS[sdk]
    subtask = File.basename(m, '.*')
    commands = TOOLCHAINS.map do |key, toolchain|
      %Q(--toolchain #{toolchain[:toolchain]} -sdk #{sdk} swiftc -emit-module "#{MODULE_INPUT_PATH}/#{m}.swift" -module-name "#{m}" -emit-module-path "#{toolchain[:module_path]}" -target "#{target}")
    end

    Utils.run(commands, task, subtask, xcrun: true)
  end

  def compile_file(f, task)
    if f.match('swift3')
      toolchain = TOOLCHAINS[:swift3]
    else
      puts "Unable to typecheck Swift 2 file #{f}"
      return true
    end

    if f.match('iOS')
      sdks = [:iphoneos]
    elsif f.match('macOS')
      sdks = [:macosx]
    else
      sdks = [:iphoneos, :macosx, :appletvos, :watchos]
    end

    commands = sdks.map do |sdk|
      %Q(--toolchain #{toolchain[:toolchain]} -sdk #{sdk} swiftc -typecheck -target #{SDKS[sdk]} -I #{toolchain[:module_path]} "#{MODULE_OUTPUT_PATH}/Definitions.swift" #{f})
    end
    subtask = File.basename(f, '.*')

    begin
      Utils.run(commands, task, subtask, xcrun: true)
      return true
    rescue
      Utils.print_error "Failed to compile #{f}!"
      return false
    end
  end
end

task :default => "xcode:test"
