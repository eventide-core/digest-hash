require_relative 'automated_init'

context "Digest" do
  text = Controls::Digest.text
  comment "Text: #{text}"

  digest = Digest::Hash.digest(text)

  control_digest = Controls::Digest.example

  comment "Digest: #{digest.inspect}"
  detail "Control Digest: #{control_digest.inspect}"

  test do
    assert(digest == control_digest)
  end
end
