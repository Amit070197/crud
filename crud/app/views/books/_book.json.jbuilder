json.extract! book, :id, :name, :author, :publication_year, :created_at, :updated_at
json.url book_url(book, format: :json)
