class Page < ActiveRecord::Base

  extend FriendlyId

  friendly_id :permalink

  has_ancestry
  
end
