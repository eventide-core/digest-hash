require_relative 'automated_init'

context "Multiple Updates" do
  text = Controls::Digest.text

  slices = [
    text[0...2],
    text[2...3],
    text[3..]
  ]

  text = slices.join
  comment "Text: #{text}"

  digest = Digest::Hash.new

  slices.each do |slice|
    digest << slice
    comment "Slice: #{slice.inspect}"
  end

  context "Hash" do
    hash = digest.hash

    control_hash = Controls::Hash.example

    comment("Hash: 0x%016X" % hash)
    detail("Control Hash: 0x%016X" % control_hash)

    test do
      assert(hash == control_hash)
    end
  end
end
