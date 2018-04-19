# Demo
   https://kansuji.herokuapp.com/to_kansujis

# Exercise

Let's create a kanji conversion library and digital characters

## For example
- 1.to_kansuji # => "一"
--to.number # => 1

# Environmental architecture

Install ruby2.3 or higher (recommend rbenv)

$ bundle install

# Evaluate

Will pass ↓
`` `sh
$ bundle exec rspec
`` `
# Document
https://en.wikipedia.org/wiki/Japanese_numerals


-In addition, the following points should be noted

- Do not change spec / lib / acceptance_spec.rb
- ghi mã lib / kansuji.rb, spec / lib / kansuji_spec.rb, nếu không có lý do lý do, không thay đổi tập tin.
- I want the lib / kansuji.rb file to be under 50 lines
- Make TDD using rspec for code (Test-driven development)
- Since the spec / lib / acceptance_spec.rb file was written a few years ago, do not use rspec.
