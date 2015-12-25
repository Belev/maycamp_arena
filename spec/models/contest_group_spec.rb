describe ContestGroup do
  let(:contest_group) { build(:contest_group) }

  it "has a valid factory" do
    expect(contest_group).to be_valid
  end

  describe "ContestGroup validations" do
    it { expect(contest_group).to validate_presence_of(:name) }
  end

  describe "ContestGroup associations" do
    it { expect(contest_group).to have_many(:contests).dependent(:destroy) }
  end
end