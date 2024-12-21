class LinksController < ApplicationController
  def new
    @link = Link.new
    @shortened_link = Link.find_by(id: params[:shortened_link_id]) if params[:shortened_link_id]
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to root_path(shortened_link_id: @link.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def redirect
    @link = Link.find_by(slug: params[:slug])
    if @link
      redirect_to @link.original_url, allow_other_host: true
    else
      render plain: "Link not found", status: :not_found
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
