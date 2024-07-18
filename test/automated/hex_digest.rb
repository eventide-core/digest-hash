require_relative 'automated_init'

context "Digest" do
  context "Hexadecimal Digest" do
    text = Controls::Digest.text
    comment "Text: #{text}"

    digest = Digest::Hash.hexdigest(text)

    control_digest = Controls::Digest::Hex.example

    comment "Hex Digest: #{digest.inspect}"
    detail "Control Hex Digest: #{control_digest.inspect}"

    test do
      assert(digest == control_digest)
    end
  end
end
