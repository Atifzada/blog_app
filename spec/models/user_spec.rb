require 'rails_helper'

describe User, type: :model do
  subject { User.create(name: 'Atif', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'A Pakistani Micronauts.', posts_counter: 0) }

  before { subject.save }

  it 'user successful created' do
    expect(subject).to be_valid
  end

  it 'name cannot be black' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter cannot be blank' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'name cannot be empty' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be integer' do
    subject.posts_counter = 1.2
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater or equal to 0' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'posts_counter should be greater or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts_counter be bigger or equal to 0' do
    subject.posts_counter = 200
    expect(subject).to be_valid
  end
end
