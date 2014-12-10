describe "comment specs" do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:comment) { create(:spree_comment, :user => user, :product => product) }
  context "touching" do
    it "should update product" do
      expect(comment.product).to receive(:touch)
      comment.touch
    end
  end
end
