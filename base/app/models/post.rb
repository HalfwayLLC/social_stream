class Post < ActiveRecord::Base
  include SocialStream::Models::Object

  MAXIMUM_LENGTH = 144

  alias_attribute :text, :description
  validates :text,
    presence: true,
    length: { maximum: MAXIMUM_LENGTH }

  define_index do
    activity_object_index
  end

  def title
    description.truncate(30, :separator =>' ')
  end

end
