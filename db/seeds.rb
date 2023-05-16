# frozen_string_literal: true

# Create 10 users with randomized data
10.times do
  User.create!(
    name: Faker::Name.name,
    photo: Faker::Avatar.image,
    bio: Faker::Lorem.sentence(word_count: 10)
  )
end

# Create 50 posts with randomized data
50.times do
  Post.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    text: Faker::Lorem.paragraph(sentence_count: 10),
    author: User.order(Arel.sql('RANDOM()')).first
  )
end

# Create 100 comments with randomized data
100.times do
  Comment.create!(
    text: Faker::Lorem.paragraph(sentence_count: 10),
    author: User.order(Arel.sql('RANDOM()')).first,
    post: Post.order(Arel.sql('RANDOM()')).first
  )
end

# Create 200 likes with randomized data
500.times do
  user = User.order(Arel.sql('RANDOM()')).first
  post = Post.order(Arel.sql('RANDOM()')).first
  # But only if the user hasn't liked the post yet
  next if Like.exists?(author: user, post:)

  Like.create!(
    author: user,
    post:
  )
end
