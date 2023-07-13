require 'rails_helper'

RSpec.describe Comment, type: :model do
  @user1 = User.new(name: 'Tom', photo: 'url here', bio: 'bio text here')
  @user2 = User.new(name: 'Lilly', photo: 'url here', bio: 'bio text here')
  @post1 = Post.new(author: @user1, title: 'Hello', text: 'this is my first post')

  subject { Comment.create(post: @post1, author: @user2, text: 'Hi Tom!') }

  before { subject.save }

  it 'should have a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'should have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should have a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'should belong to an author' do
    association = Comment.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'should belong to a post' do
    association = Comment.reflect_on_association(:post)
    expect(association.macro).to eq(:belongs_to)
  end
end
