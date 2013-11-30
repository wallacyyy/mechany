# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec, focus_on_failed: false, keep_failed: true, cmd: 'bundle exec rspec'  do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^endpoints/(.+)\.rb$})     { |m| "spec/endpoints/#{m[1]}_spec.rb" }
  watch(%r{^dsl/(.+)\.rb$})     { |m| "spec/dsl/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

