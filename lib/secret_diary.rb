class SecretDiary
  attr_reader :locked, :diary

  def initialize
    @locked = true
    @diary = []
  end

  def add_entry(text)
    if @locked == true
      fail "Cannot add entry, locked diary"
    else
      @diary << text
      text
    end
  end

  def get_entries
    if @locked == true
    fail "Cannot get entries, locked diary"
    else
      @diary
    end
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end
end
