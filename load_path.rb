require_relative 'gems/gems_init'

reference_dir = File.dirname(caller[0] || '.')

lib_dir = File.expand_path("lib", reference_dir)
if File.directory?(lib_dir) && !$LOAD_PATH.include?(lib_dir)
  $LOAD_PATH.unshift(lib_dir)
end

libraries_dir = ENV["LIBRARIES_HOME"]
return if libraries_dir.nil?

libraries_dir = File.expand_path(libraries_dir)

Dir.glob("#{libraries_dir}/*/lib") do |library_dir|
  if not $LOAD_PATH.include?(library_dir)
    $LOAD_PATH.unshift(library_dir)
  end
end
