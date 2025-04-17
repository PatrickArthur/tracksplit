class BeatSerializer < ActiveModel::Serializer
  attributes :id, :title, :file_url, :created_at, :price

  belongs_to :user

  def file_url
    Rails.application.routes.url_helpers.rails_blob_url(object.file, host: ENV['HOST'] || 'http://localhost:4000') if object.file.attached?
  end
end
