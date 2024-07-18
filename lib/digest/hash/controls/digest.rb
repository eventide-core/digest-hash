module Digest
  class Hash
    module Controls
      module Digest
        def self.example
          hash = Hash.example

          [hash].pack('Q>')
        end

        def self.text
          Hash.text
        end

        module Hex
          def self.example
            hash = Hash.example

            '%016X' % hash
          end
        end
      end
    end
  end
end
