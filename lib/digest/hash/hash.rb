module Digest
  class Hash
    attr_accessor :hash

    def buffer
      @buffer ||= String.new(
        encoding: 'BINARY',
        capacity: self.class.digest_size_bytes
      )
    end

    def previous_hash
      @previous_hash ||= 0
    end
    attr_writer :previous_hash

    def self.digest(text)
      instance = new
      instance.update(text)
      instance.digest
    end

    def self.hexdigest(text)
      instance = new
      instance.update(text)
      instance.hexdigest
    end

    def self.file(path)
      instance = new

      File.open(path, 'r') do |io|
        until io.eof?
          text = io.read
          instance.update(text)
        end
      end

      instance
    end

    def update(text)
      byte_offset = 0

      bitmask = IrrationalNumber.numerator

      irrational_denominator = IrrationalNumber.denominator

      digest_size_bytes = self.class.digest_size_bytes

      until byte_offset == text.bytesize
        bytes_remaining = digest_size_bytes - buffer.bytesize

        slice = text.byteslice(byte_offset, bytes_remaining)
        slice.force_encoding('BINARY')

        buffer << slice

        buffer_hash = 0

        buffer.unpack('C*') do |byte|
          buffer_hash <<= 8

          buffer_hash += byte
        end

        buffer_hash += irrational_denominator
        buffer_hash += previous_hash << 6
        buffer_hash += previous_hash >> 2

        next_hash = previous_hash ^ buffer_hash
        next_hash &= bitmask

        self.hash = next_hash

        if buffer.bytesize == digest_size_bytes
          self.previous_hash = next_hash

          buffer.clear
        end

        byte_offset += slice.bytesize
      end

      hash
    end
    alias :<< :update

    def digest
      [hash].pack('Q>')
    end

    def hexdigest
      '%016X' % hash
    end

    def self.digest_size_bytes
      digest_size_bits / 8
    end

    def self.digest_size_bits
      64
    end
  end
end