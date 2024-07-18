require_relative 'automated_init'

context "Unicode Text" do
  text = Controls::UnicodeCharacters::Text.example
  comment "Text: #{text}"

  slices = [
    text[0...2],
    text[2...3],
    text[3..]
  ]

  digest = Digest::Hash.new

  slices.each do |slice|
    digest << slice
    comment "Slice: #{slice.inspect}"
  end

  context "Hash" do
    hash = digest.hash

    control_hash = Controls::UnicodeCharacters::Hash.example

    comment("Hash: 0x%016X" % hash)
    detail("Control Hash: 0x%016X" % control_hash)

    test do
      assert(hash == control_hash)
    end
  end
end
