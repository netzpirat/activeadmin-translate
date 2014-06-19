# ActiveAdmin Translate

Translate your [Globalize3](https://github.com/svenfuchs/globalize3)
or [Traco](https://github.com/barsoom/traco) ActiveModel translations
in [ActiveAdmin](https://github.com/gregbell/active_admin),
using [jQueryUI tabs](http://jqueryui.com/tabs/) to switch
between the locales.

## Installation

Add the gem to your `Gemfile` with your i18n db backend `globalize3` or `traco`

```ruby
gem 'activeadmin-translate'
gem 'globalize3' # OR
gem 'traco'
```

and install it with Bundler:

```Bash
$ bundle
```

## Configuration

### Set available languages

ActiveAdmin Translate takes the available languages from `I18n.available_locales`, so you want to configure them in
your `application.rb` like

```ruby
config.i18n.available_locales = [:en, :de, :fr, :it]
```

### Include ActiveAdmin Translate

You need to import the SASS for styling the tabs to `app/assets/stylesheets/active_admin.css.scss`:

```css
@import "active_admin/translate";
```

If `ActiveAdmin` has not already loaded jQuery UI tabs library,
you need to manually require the file in `app/assets/stylesheets/active_admin.js.coffee`:

```js
#= require jquery.ui.tabs
```

## Usage

### Make your translations accessible (Globalize3 only)

In order to access the translations of your model and be able to write them on save, you need to make attributes
accessible in your model. Globalize3 stores the model translations in a separate table that is accessible as
`translations` in your model:

```ruby
class GlobalizedModel < ActiveRecord::Base
  attr_accessible :translations, :translations_attributes
  accepts_nested_attributes_for :translations
end
```

### Translate your ActiveAdmin forms


To translate your form you need to use the `translate_inputs` form helper:

```ruby
form do |f|
  # globalize3:
  f.translate_inputs do |t|
    t.input :title
    t.input :description
  end

  # traco:
  f.translate_inputs do |locale|
    t.input :"title_#{locale}"
    t.input :"description_#{locale}"
  end
end
```

### Translate your ActiveAdmin attributes table

To show the attributes for all locales, you use the `translate_attributes_table_for` view helper:

```ruby
show do |model|
  panel 'Localized Model' do
    translate_attributes_table_for model do
      row :title
      row :description do |p|
        BlueCloth.new(p.teaser).to_html.html_safe
      end
    end
  end
end
```

### Localize the languages

To localize your locale names, use the following I18n key structure per locale:

```yml
en:
  active_admin:
    translate:
      en: "English"
```

and add more translations with the registered locale symbol.

## Author

Developed by Michael Kessler, [FlinkFinger GmbH](http://www.flinkfinger.com).

If you like ActiveAdmin Translate, you can watch the repository at
[GitHub](https://github.com/netzpirat/activeadmin-globalize) and follow [@netzpirat](https://twitter.com/#!/netzpirat)
on Twitter for project updates.

## Contribute to ActiveAdmin Translate

### File an issue

You can report bugs and feature requests to [GitHub Issues](https://github.com/netzpirat/activeadmin-globalize/issues).

**Please don't ask question in the issue tracker**, instead ask them at Stackoverflow and use the
[activeadmin](http://stackoverflow.com/questions/tagged/activeadmin) tag.

When you file a bug, please try to follow these simple rules if applicable:

* Make sure you've read the README carefully.
* Give as much information about your environment, like Ruby and ActiveAdmin version.
* Make sure that the issue is reproducible with your description.

**It's most likely that your bug gets resolved faster if you provide as much information as possible!**

### Development

* Documentation hosted at [RubyDoc](http://rubydoc.info/github/netzpirat/activeadmin-globalize/master/frames).
* Source hosted at [GitHub](https://github.com/netzpirat/activeadmin-globalize).

Pull requests are very welcome! Please try to follow these simple rules if applicable:

* Please create a topic branch for every separate change you make.
* Update the [Yard](http://yardoc.org/) documentation.
* Update the [README](https://github.com/netzpirat/activeadmin-globalize/blob/master/README.md).
* Update the [CHANGELOG](https://github.com/netzpirat/activeadmin-globalize/blob/master/CHANGELOG.md) for noteworthy changes.
* Please **do not change** the version number.

## Contributors

See the [CHANGELOG](https://github.com/netzpirat/activeadmin-globalize/blob/master/CHANGELOG.md) and the GitHub list of
[contributors](https://github.com/netzpirat/activeadmin-globalize/contributors).

## Acknowledgment

This project has taken some ideas and code from the following projects:

- [activeadmin-globalize3](https://github.com/stefanoverna/activeadmin-globalize3) from [Stefano Verna](https://github.com/stefanoverna)
- [ActiveAdmin-Globalize3-inputs](https://github.com/mimimi/ActiveAdmin-Globalize3-inputs) from [Dmitrii Soltis](https://github.com/mimimi)

## License

Copyright (c) 2012 Michael Kessler

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
