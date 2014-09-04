class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username
  acts_as_taggable

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def tags
    self.tag_list.to_a
  end
end
