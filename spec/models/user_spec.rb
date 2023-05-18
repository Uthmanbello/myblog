require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Uthman', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Programmer', posts_counter: 2) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be Uthman' do
    expect(subject.name).to eql 'Uthman'
  end

  it 'photo should be valid' do
    expect(subject.photo).to eql 'https://unsplash.com/photos/F_-0BxGuVvo'
  end

  it 'bio should be Programmer' do
    expect(subject.bio).to eql 'Programmer'
  end

  it 'posts counter should be present' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be 2' do
    expect(subject.posts_counter).to eql 2
  end

  it 'posts counter should be integer' do
    subject.posts_counter = 2.5
    expect(subject).to_not be_valid
  end

  it 'posts counter should be greater than or equal to 0' do
    subject.posts_counter = -3
    expect(subject).to_not be_valid
  end

  it 'should return the 3 most recent posts for the user' do
    expect(subject.recent_posts).to eq(subject.posts.order(created_at: :desc).limit(3))
  end
end
