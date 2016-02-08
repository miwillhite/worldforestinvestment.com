# World Forest Investment Marketing Website

## Requirements

* [homebrew](http://brew.sh/)
* [chruby](https://github.com/postmodern/chruby)
* [ruby-install](https://github.com/postmodern/ruby-install)
* [Ruby](https://www.ruby-lang.org/en/)
* [Bundler](http://bundler.io/)
* Xcode CLI

## Getting Started

1. Install Xcode tools

```bash
xcode-select --install
```

2. Install homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

3. Install chruby and ruby-install

```bash
brew install chruby ruby-install
```

4. Enable auto-switching: https://github.com/postmodern/chruby#auto-switching

5. Install the Ruby specified in `.ruby-version`

```bash
ruby-install ruby 2.x.x
```

6. Install bundler and required gems

```bash
gem install bundle
bundle
```

## Development

Run the local server with
```bash
bundle exec middleman server
```

## Deploy

TODO


## Troubleshooting

```bash
gem install nokogiri -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2 --use-system-libraries
```

