class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new()
    @bookmark.list = @list
    @bookmark.movie = Movie.find(params[:bookmark][:movie_id].to_i)
    @bookmark.comment = params[:bookmark][:comment]
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end
end
