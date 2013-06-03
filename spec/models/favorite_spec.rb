require 'spec_helper'

describe Favorite do
  it { should be_a_kind_of ActiveModel::ForbiddenAttributesProtection }
  it { should validate_presence_of :meal }
  it { should belong_to :user }
  it { should have_one  :cut }
end
