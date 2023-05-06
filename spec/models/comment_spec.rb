require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Uthman', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Programmer',
                     posts_counter: 0)
  post = Post.create(title: 'My life', text: 'Once upon a time ...', comments_counter: 1, likes_counter: 0,
                     author: user)
  subject { Comment.new(text: 'Nice piece', author: user, post:) }

  before { subject.save }

  it 'comments counter should be 1' do
    expect(post.comments_counter).to eq 1
  end

  it 'should not be valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
