# World Forest Investment Marketing Website

## Resources

[Staging Server](http://worldforestinvestment.com.s3-website-us-east-1.amazonaws.com/)

## Requirements

* [homebrew](http://brew.sh/)
* [chruby](https://github.com/postmodern/chruby)
* [ruby-install](https://github.com/postmodern/ruby-install)
* [Ruby](https://www.ruby-lang.org/en/)
* [Bundler](http://bundler.io/)
* Xcode CLI

## Getting Started

1. Install Xcode tools

  ```
  xcode-select --install
  ```

2. Install homebrew

  ```
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

3. Install chruby and ruby-install

  ```
  brew install chruby ruby-install
  ```

4. Enable auto-switching: https://github.com/postmodern/chruby#auto-switching

5. Install the Ruby specified in `.ruby-version`

  ```
  ruby-install ruby 2.x.x
  ```

6. Install bundler and required gems

  ```
  gem install bundle
  bundle
  ```

## Development

Run the local server with

```
bundle exec middleman
```

## Deploy

Sync with AWS S3 host

```
bundle exec middleman s3_sync --build # NOTE: If this fails with an error, run first: bundle exec middleman build
```


## Troubleshooting

```bash
gem install nokogiri -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2 --use-system-libraries
```

