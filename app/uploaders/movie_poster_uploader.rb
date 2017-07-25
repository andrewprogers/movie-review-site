class MoviePosterUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :medium do
    process resize_to_fit: [400, 400]
  end

  version :thumb do
    process resize_to_fit: [150, 150]
  end
end
