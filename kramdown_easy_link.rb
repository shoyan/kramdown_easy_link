module Kramdown
  module Parser

    # Standard Kramdown parser extends auto link.
    #
    # This class extends the default Kramdown syntax with a new block-level
    # element for embedding `http://example.com`. The element is rendered
    # as a `<a href="http://example.com">http://example.com</a>`.
    #
    # @author Shohei Yamasaki
    class KramdownEasyLink < ::Kramdown::Parser::GFM

      def initialize(source, options)
        super
        @block_parsers.unshift(:easy_link)
      end

      EASY_LINK_START = /^#{OPT_SPACE}(https?:\/\/[\S\.]+)/

      # Do not use this method directly, it's used internally by Kramdown.
      # @api private
      def parse_easy_link
        @src.pos += @src.matched_size
        url = @src[1]
        @tree.children << Element.new(:easy_link, url)
      end
      define_parser(:easy_link, EASY_LINK_START)
    end
  end
end

module Kramdown
  module Converter
    class Html
      # Convert a started http string into a `<a>` tag suitable for embedding.
      #
      # @return [String] an HTML fragment representing this element
      # @api private
      def convert_easy_link(el, indent)
        "#{' '*indent}<p><a href=\"#{el.value}\">#{el.value}</a></p>"
      end
    end
  end
end
