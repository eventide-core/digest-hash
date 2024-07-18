require_relative 'automated_init'

context "Update" do
  text = Controls::Hash.text
  comment "Text: #{text}"

  digest = Digest::Hash.new

  digest.update(text)

  context "Hash" do
    hash = digest.hash

    control_hash = Controls::Hash.example

    comment("0x%016X" % hash)
    detail("Control Hash: 0x%016X" % control_hash)

    test do
      assert(hash == control_hash)
    end
  end
end
