# SecretDiary
#   - lock
#   - unlock
#   - add_entry
#   - get_entries
#
# Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.
load './lib/secret_diary.rb'
diary = SecretDiary.new
diary.add_entry
#=> noMethodEr
diary.get_entries
#=> noMethodEr

# When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.

diary.unlock
#says 'tadaaaaa unlocked'
diary.add_entry(text) == @entry << text
get_entries == @entries

# When the user calls `lock` again they throw errors again.

diary.lock
diary.add_entry => error
get_entries => error
