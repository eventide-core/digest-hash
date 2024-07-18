require_relative 'automated_init'

context "Ordering" do
  control_text = 'aaaaaaaabbbbbbbb'
  control_digest = Digest::Hash.digest(control_text)

  text = 'bbbbbbbbaaaaaaaa'
  digest = Digest::Hash.digest(text)

  comment "Digest: #{digest.inspect} (#{text})"
  detail "Control: #{control_digest.inspect} (#{control_text})"

  test "Digests are different" do
    refute(digest == control_digest)
  end
end
