require 'secret_diary'

describe SecretDiary do
  describe "#locked" do
    it "is locked by default" do
      expect(subject.locked).to eq true
    end
  end

  describe "#diary" do
    it "creates an empty array to store entries" do
      expect(subject.diary).to eq([])
    end
  end

  describe "#add_entry" do
    it "Raise an error when accessing add_entry initially" do
      expect{subject.add_entry("Hello")}.to raise_error("Cannot add entry, locked diary")
    end

    it "add entry to the diary" do
      subject.unlock
      subject.add_entry("Hello")
      expect(subject.get_entries).to eq(["Hello"])
    end

    it "when diary is locked, raise error when adding entry" do
      subject.unlock
      subject.lock
      expect{subject.add_entry("Hello")}.to raise_error("Cannot add entry, locked diary")
    end
  end

  describe "#get_entries" do
    it "Raise an error when accessing get_entries initially" do
      expect{subject.get_entries}.to raise_error("Cannot get entries, locked diary")
    end
    
    it "when diary is locked, raise error when adding entry" do
      subject.unlock
      subject.lock
      expect{subject.get_entries}.to raise_error("Cannot get entries, locked diary")
    end
  end

  describe "#unlock" do
    it "should unlock the diary by returning @locked = false" do
      subject.unlock
      expect(subject.locked).to eq false
    end

    it "when diary is unlocked, add entry should returns entry" do
      subject.unlock
      expect(subject.add_entry("Hello")).to eq("Hello")
    end

    it "when diary is unlocked, show all entries" do
      subject.unlock
      subject.add_entry("Hello")
      subject.add_entry("Today was fun")
      expect(subject.get_entries).to eq(["Hello","Today was fun"])
    end
  end

 describe "#lock" do
   it "should lock the diary" do
     subject.lock
     expect(subject.locked).to eq true
   end
 end
end
