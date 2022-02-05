json.extract! image_upload, :id, :name, :created_at, :updated_at
json.url image_upload_url(image_upload, format: :json)
