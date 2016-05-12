class User < ActiveRecord::Base
  extend Enumerize

  enumerize :gender, in: [:male, :female]

  has_attached_file :avatar, styles: { thumb: "100x100#" }, default_url: "/avatars/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
