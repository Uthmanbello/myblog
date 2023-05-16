require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'Hello', text: 'I am good at this', comments_counter: 2, likes_counter: 2, author_id: 2)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be Hello' do
    expect(subject.title).to eql 'Hello'
  end

  it 'title should be a maximum of 250 words' do
    subject.title = 'a' * 270
    expect(subject).to_not be_valid
  end

  it 'text should be valid' do
    expect(subject.text).to eql 'I am good at this'
  end

  it 'comments counter should be present' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'comments counter should be valid' do
    expect(subject.comments_counter).to eql 2
  end

  it 'comments counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments counter should be an integer' do
    subject.comments_counter = 2.1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be present' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'likes counter should be valid' do
    expect(subject.likes_counter).to eql 2
  end

  it 'likes counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be an integer' do
    subject.likes_counter = 2.1
    expect(subject).to_not be_valid
  end

  it 'should return the 5 most recent comments for the post' do
    expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
  end
end
