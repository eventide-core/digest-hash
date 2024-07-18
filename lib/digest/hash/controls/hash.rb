module Digest
  class Hash
    module Controls
      module Hash
        def self.example(slices=nil)
          slices ||= self.slices

          irrational_denominator = IrrationalNumber.denominator

          limit = IrrationalNumber.numerator

          hash = 0

          slices.each do |slice|
            slice.force_encoding('BINARY')

            slice_hash = slice.rjust(8, "\0").unpack1('Q>')

            hash ^= slice_hash + irrational_denominator + (hash << 6) + (hash >> 2)

            hash &= limit
          end

          hash
        end

        def self.slices
          [
            text[0...8],
            text[8..]
          ]
        end

        def self.text
          Text.example
        end
      end
    end
  end
end
