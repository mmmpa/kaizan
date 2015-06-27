module Kaizan
  refine String do
    alias :gsub_not_safety! :gsub!
  end
end

module ActionView
  using Kaizan

  module Helpers
    def alter_past(name, content)
      output_buffer.alter_past!(name, content)
    end


    def altering_anchor(name = nil)
      output_buffer.register_anchor(name)
    end
  end

  class OutputBuffer

    attr_accessor :altering_anchor, :anonymous_anchor


    def initialize(*)
      super

      self.altering_anchor = {}
      self.anonymous_anchor = []
    end


    def alter_past!(name, content)
      return unless (anchor = detect_anchor(name)).present?
      gsub_not_safety!(anchor, html_escape_interpolated_argument(content))
    end


    def register_anchor(name = nil)
      generate_anchor(name).tap { |anchor|
        anonymous_anchor.push(anchor)
        altering_anchor[name] = anchor if name.present?
      }.html_safe
    end


    private

    def detect_anchor(name)
      name.is_a?(Fixnum) ? anonymous_anchor[name] : altering_anchor[name]
    end


    def generate_anchor(name = nil)
      if name && altering_anchor[name]
        altering_anchor[name]
      else
        "<!-- altering_anchor:#{SecureRandom.hex(16)} -->"
      end
    end
  end
end