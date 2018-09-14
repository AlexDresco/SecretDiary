Secret Diary - Learning about encapsulation
============================================


## User story:
SecretDiary
  - lock
  - unlock
  - add_entry
  - get_entries

Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.

When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.

When the user calls `lock` again they throw errors again.

## Feature test:

```ruby load './lib/secret_diary.rb'
diary = SecretDiary.new
diary.add_entry("Hello")

# Should raise raise_error because locked up.

load './lib/secret_diary.rb'
diary = SecretDiary.new
diary.add_entry("Hello")
diary.get_entries
# Should raise raise_error because locked up.

load './lib/secret_diary.rb'
diary = SecretDiary.new
diary.unlock
# Should return @status == unlocked

load './lib/secret_diary.rb'
diary = SecretDiary.new
diary.unlock
diary.add_entry("Hello")

# Shouldn't return an error because diary is unlocked. Return the entry and add it to the diary.

load './lib/secret_diary.rb'
diary = SecretDiary.new
diary.unlock
diary.get_entries

# Shouldn't return an error because diary is unlocked. Show all entries.
load './lib/secret_diary.rb'
diary = SecretDiary.new
diary.unlock
diary.add_entry"Hello"
diary.lock
diary.add_entry"Hello"

# Should return error, diary is locked
load './lib/secret_diary.rb'
diary = SecretDiary.new
diary.unlock
diary.add_entry"Hello"
diary.get_entries
diary.lock
diary.get_entries
# Should return error, diary is locked
diary.add_entry"Hello"
# Should return error, diary is locked
