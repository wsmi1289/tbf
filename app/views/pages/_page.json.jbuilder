json.extract! page, :id, :slug, :name, :content, :created_at, :updated_at
json.url page_url(page, format: :json)
