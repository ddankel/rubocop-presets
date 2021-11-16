require "open3"

RSpec.describe "rubocop" do
  it "has no offenses" do
    command = self.class.description
    stdout, stderr, status = Open3.capture3("bundle", "exec", command)
    output = stderr.size.positive? ? stderr : stdout

    expect(status.success?).to eq(true), output
  end
end
