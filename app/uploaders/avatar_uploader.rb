require 'image_processing/mini_magick'

class AvatarUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions
  plugin :remove_attachment

  process(:store) do |io, context|
    original = io.download
    size_300 = resize_to_fill(original, 300, 300)
    size_84 = resize_to_fill(original, 84, 84)

    { original: original, large: size_300, small: size_84 }
  end
end
