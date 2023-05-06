# require_relative '../rails_helper'

# RSpec.describe Comment, type: :model do
#   describe '#update_post_comments_counter' do
#     let(:user) { create(:user) }
#     let(:post) { create(:post, author: user) }

#     context 'when a comment is added to a post' do
#       it 'updates the post comments counter' do
#         expect {
#           create(:comment, post: post, author: user)
#         }.to change { post.reload.comments_counter }.by(1)
#       end
#     end

#     context 'when a comment is deleted from a post' do
#       let!(:comment) { create(:comment, post: post, author: user) }

#       it 'updates the post comments counter' do
#         expect {
#           comment.destroy
#         }.to change { post.reload.comments_counter }.by(-1)
#       end
#     end
#   end
# end


# require_relative '../rails_helper'

# RSpec.describe Comment, type: :model do
#   user = User.create(name: 'Alice', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
#   post = Post.create(title: 'Novel Resume', text: 'Lorem ipsum', comments_counter: 0, likes_counter: 0, author: user)
#   subject { Comment.new(text: 'Hello everyone', author: user, post:) }

#   before { subject.save }

#   it 'comments counter should be 1' do
#     expect(post.comments_counter).to eq 1
#   end

#   it 'should not valid without an author' do
#     subject.author = nil
#     expect(subject).to_not be_valid
#   end

#   it 'should not valid without a post' do
#     subject.post = nil
#     expect(subject).to_not be_valid
#   end
# end