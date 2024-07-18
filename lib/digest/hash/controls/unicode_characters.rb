module Digest
  class Hash
    module Controls
      module UnicodeCharacters
        module Text
          def self.example
            "\xE2\x91\xA0...\xE2\x91\xA1...\xE2\x91\xA2"
          end
        end

        module Hash
          def self.example
            Controls::Hash.example(slices)
          end

          def self.slices
            [
              "\xE2\x91\xA0...\xE2\x91",
              "\xA1...\xE2\x91\xA2"
            ]
          end
        end
      end
    end
  end
end
