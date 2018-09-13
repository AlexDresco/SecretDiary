require 'secret_diary'

describe SecretDiary do
  describe "#status" do
    it "is locked by default" do
      expect(subject.status).to eq("Locked")
    end
  end

  describe "#diary" do
    it "creates an empty array to store entries" do
      expect(subject.diary).to eq([])
    end
  end

  describe "#add_entry" do
    it "Raise an error when accessing add_entry" do
      expect{subject.add_entry("Hello")}.to raise_error("Cannot add entry, locked diary")
    end

    it { is_expected.to respond_to(:add_entry).with(1).argument }

    it "add entry to the diary" do
      subject.unlock
      subject.add_entry("Hello")
      expect(subject.get_entries).to eq(["Hello"])
    end

  end

  describe "#get_entries" do
    it "Raise an error when accessing get_entries" do
      expect{subject.get_entries}.to raise_error("Cannot get entries, locked diary")
    end
  end

  describe "#unlock" do
    it { is_expected.to respond_to :unlock }

    it "should unlock the diary by returning @status = unlocked" do
      subject.unlock
      expect(subject.status).to eq("Unlocked")
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
     it "should lock the diary by returning a locked status" do
       subject.lock
       expect(subject.status).to eq("Locked")
     end
   end
end
