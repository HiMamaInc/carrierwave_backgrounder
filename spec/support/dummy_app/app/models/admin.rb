class Admin < ApplicationRecord
  # Single attachment support
  mount_uploader :avatar, AvatarUploader
  process_in_background :avatar

  # Multi attachment support
  mount_uploaders :images, AvatarUploader
  process_in_background :images
  if ActiveRecord.gem_version >= Gem::Version.new('7.1')
    serialize :images, coder: JSON
  else
    serialize :images, JSON
  end
end
