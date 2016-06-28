kramdown-easy-link
=============

This plugins extends the GFM [kramdown](http://kramdown.gettalong.org/) parser with a new block-level element which adds support for `http://example.com`. The element is rendered  as a `<p><a href="http://example.com">http://example.com</a></p>`.

Usage
-----

### With Jekyll or Octopress

* Clone this project into your _plugins directory.
* Add the following lines to your _config.yml

```ruby
markdown: kramdown
kramdown:
  input: KramdownEasyLink
```

### With standalone kramdown

Usage with standalone kramdown is similar:

```ruby
require 'kramdown'
require './kramdown_easy_link'

Kramdown::Document.new(content, :input => 'KramdownEasyLink').to_html
```
