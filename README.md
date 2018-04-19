# Demo
  https://kansuji.herokuapp.com/to_kansujis

# Bài tập

Hãy tạo library chuyển đổi kanji và kí tự số 

## Ví dụ
- 1.to_kansuji #=> "一"
- "一".to_number #=> 1

# Kiến trúc môi trường

Install ruby2.3 trở lên (recommend rbenv)

$ bundle install

# Đánh giá

Sẽ pass ↓
```sh
$ bundle exec rspec
```
# Document
https://en.wikipedia.org/wiki/Japanese_numerals 


-In addition, the following points should be noted

- Do not change spec / lib / acceptance_spec.rb
- Write the code in lib / kansuji.rb, spec / lib / kansuji_spec.rb, if there is no special reason, do not change the file.
- I want the lib / kansuji.rb file to be under 50 lines
- Make TDD using rspec for code (Test-driven development)
- Since the spec / lib / acceptance_spec.rb file was written a few years ago, do not use rspec.
