class PapersController < ApplicationController

  def index
    @papers = Paper.all
  end

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.create(paper_params)
    redirect_to @paper
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def update
    @paper = Paper.find(params[:id])
    @paper.update(paper_params)
    redirect_to @paper
  end

  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy
    redirect_to @papers
  end

  private

  def paper_params
    params.require(:paper).permit(:title, :body)
  end

end