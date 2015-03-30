require 'rails_helper'

describe Tweed do
  it { should validate_presence_of :body }
  it { should belong_to :user }
end
