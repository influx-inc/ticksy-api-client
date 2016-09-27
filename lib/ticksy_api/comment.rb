module TicksyAPI
  class Comment < OpenStruct
    def self.from_hash(hash)
      hash.map do |key, data|
        Comment.new(data) unless key == "attachments"
      end.compact
    end
  end
end
