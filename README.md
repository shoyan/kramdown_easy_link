kramdown-easy-link
=============

This plugins extends the default [kramdown](http://kramdown.gettalong.org/) parser with a new block-level element which adds support for `http://example.com`. The element is rendered  as a `<a href="http://example.com">http://example.com</a>`.

Usage
-----

### With Jekyll or Octopress

* Clone this project into your _plugins directory.
* Add the following lines to your _config.yml

```
markdown: kramdown
kramdown:
  input: KramdownEasyLink
```

### With standalone kramdown

Usage with standalone kramdown is similar:

```
require 'kramdown'
require './kramdown-gist'

Kramdown::Document.new(content, :input => 'KramdownEasyLink').to_html
```
