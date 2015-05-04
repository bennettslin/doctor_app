class PapersController < ApplicationController

  def index
    @papers = Paper.all
  end

  def new
    @paper = Paper.new
    @tags = Tag.all
  end

  def create
    @paper = Paper.create(paper_params)

    tags = params[:paper][:tag_ids]
    tags.each do |tag_id|
      @paper.tags << Tag.find(tag_id) unless tag_id.blank?
    end

    redirect_to @paper
  end

  def show
    @paper = Paper.find(params[:id])
    search = @paper.title.downcase
    list = flickr.photos.search :text => search, :sort => "relevance", per_page: 3
    @pictures = []
    for picture in list do
      object = flickr.photos.getSizes photo_id: picture.id
      index = object.to_a.index {|index| index['label'] == 'Medium 640'}
      @pictures << object[index] unless object[index].nil?
    end
  end

  def edit
    @paper = Paper.find(params[:id])
    @tags = Tag.all
  end

  def update
    @paper = Paper.update(params[:id], paper_params)

    @paper.tags.clear
    tags = params[:paper][:tag_ids]
    tags.each do |tag_id|
      @paper.tags << Tag.find(tag_id) unless tag_id.blank?
    end

    redirect_to @paper
  end

  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy
    redirect_to papers_path
  end


  private

  def paper_params
    params.require(:paper).permit(:title, :body)
  end

end