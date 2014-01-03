class Resolution < ActiveRecord::Base
  include TheComments::Commentable
  belongs_to :user

  scope :select_for_recent, -> { select('id, description, user_id') }
  scope :order_by_recent, -> { order('created_at DESC') }
  scope :recent, -> { select_for_recent.order_by_recent }
  # Denormalization methods
  # Please, read about advanced using
  def commentable_title
    "Undefined Post Title"
  end

  def commentable_url
    "#"
  end

  def commentable_state
    "published"
  end
end
