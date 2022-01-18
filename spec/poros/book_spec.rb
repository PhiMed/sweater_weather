require 'rails_helper'

describe Book do
  before :each do
    data = {
            :isbn=>"515151515151",
            :title=>"Travel Book",
            :publisher=>"Dewey, Cheatem & Howe LLC"
          }
    @book = Book.new(data)
  end

  it 'exists' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'attributes' do
      expect(@book.isbn).to eq("515151515151")
      expect(@book.title).to eq("Travel Book")
      expect(@book.publisher).to eq("Dewey, Cheatem & Howe LLC")
  end
end
