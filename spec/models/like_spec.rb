# require_relative '../rails_helper'

# RSpec.describe Like, type: :model do
#     let(:user) { User.create(name: 'John Doe') }
#     let(:post) { Post.create(title: 'A new post', content: 'Some content', author: user) }
#     let(:like) { Like.create(author: user, post: post) }
  
#     describe '#update_post_likes_counter' do
#       it 'updates the likes_counter for the associated post' do
#         expect { like.update_post_likes_counter }.to change { post.likes_counter }.by(1)
#       end
#     end
  
#     describe 'associations' do
#       it { should belong_to(:author).class_name('User') }
#       it { should belong_to(:post) }
#     end
#   end
  
require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Bob', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
  post = Post.create(title: 'Novel Resume', text: 'Lorem ipsum', comments_counter: 0, likes_counter: 0, author: user)
  subject { Like.new(author: user, post:) }

  before { subject.save }

  it 'likes counter should be 1' do
    expect(post.likes_counter).to eq 1
  end

  it 'should not valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should not valid without a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end