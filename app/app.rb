ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end
end
