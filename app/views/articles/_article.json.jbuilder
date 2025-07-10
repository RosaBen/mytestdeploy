json.extract! article, :id, :name, :description, :price, :created_at, :updated_at
json.url article_url(article, format: :json)
