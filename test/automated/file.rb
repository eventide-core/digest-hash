require_relative 'automated_init'

context "File" do
  path = __FILE__

  digest = Digest::Hash.file(path)

  context "Hash" do
    hash = digest.hash

    control_digest = Digest::Hash.new

    file_contents = File.read(path)
    control_digest << file_contents

    control_hash = control_digest.hash

    comment("0x%016X" % hash)
    detail("Control Hash: 0x%016X" % control_hash)

    test do
      assert(hash == control_hash)
    end
  end
end
