require 'rails_helper'

describe Post, type: :model do
  subject do
    first_user = User.create(name: 'Atif', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'A pakistani micronaut.', posts_counter: 0)
    Post.create(author: first_user, title: 'Hello', text: 'This is a personal post', likes_counter: 0,
                comments_counter: 0)
  end

  before { subject.save }

  it 'title cannot be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'created successful' do
    expect(subject).to be_valid
  end

  it "should check number of the  title's characters" do
    subject.title = "Lorem ipsum dolor sit, amet consectetur adipisicing elit.
    Eius dolorum velit modi suscipit Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius dolorum
    velit modi suscipit unde dignissimos unde dignissimos alias deserunt beatae sit
    vitae corrupti illum ad ratione,
    corrupti illum ad ratione, voluptas nobis. Velit nisi soluta sint
    voluptas nobis. Velit nisi soluta sint.
     alias deserunt beatae sit vitae."
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be integer' do
    subject.comments_counter = 1.2
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater or equal to 0' do
    subject.comments_counter = 0
    expect(subject).to be_valid
    subject.comments_counter = 200
    expect(subject).to be_valid
  end

  it 'comments_counter cannot be a negative' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be be greater or equal to 0' do
    subject.likes_counter = 0
    expect(subject).to be_valid
    subject.likes_counter = 200
    expect(subject).to be_valid
  end

  it 'likes_counter should be be integer' do
    subject.likes_counter = 1.2
    expect(subject).to_not be_valid
  end

  it 'likes_counter cannot be negative' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
