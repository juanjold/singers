require 'spec_helper'

describe Singer do
  it "should require first and last name" do
    singer = Singer.create
    singer.should_not be_valid
    singer.name = "John"
    singer.lastname = "val"
    singer.should_not be_valid
    singer.email = "lopez@gmail.com"
    singer.number = "1231231234"
    singer.should be_valid
  end
end
  