class SecretDiary
  attr_reader :status, :diary

  def initialize
    @status = "Locked"
    @diary = []
  end

  def add_entry(text)
    if @status == "Locked"
      fail "Cannot add entry, locked diary"
    else
      @diary << text
      text
    end
  end

  def get_entries
    if @status == "Locked"
    fail "Cannot get entries, locked diary"
    else
      @diary
    end
  end

  def unlock
    @status = "Unlocked"
  end

  def lock
    @status = "Locked"
  end

end
