require 'sinatra'
require 'sinatra/reloader'

require 'pry'
require 'csv'

require_relative 'app/models/article.rb'

set :bind,'0.0.0.0'

get "/" do
  redirect '/articles'
end

get "/articles" do
  @article_objects = []

  CSV.foreach('articles.csv', headers: true) do |row|
    new_article = Article.new(
      row["title"],
      row["url"],
      row["description"]
    )
    @article_objects << new_article
  end

  erb :index
end

get "/articles/new" do

  erb :new
end

def retreive_articles

  article_objects = []

  CSV.foreach('articles.csv', headers: true) do |row|
    new_article = Article.new(
      row["title"],
      row["url"],
      row["description"]
    )

    article_objects << new_article
  end
  article_objects
end

post "/articles" do
  title = params["title"]
  url = params["url"]
  description = params["description"]

  if description == "" || title == "" || url == ""
    redirect '/articles/new'
  else
    CSV.open("articles.csv", "a") do |csv_file|
      csv_file << [title, url, description]
    end
  end

  redirect "/articles"
end
