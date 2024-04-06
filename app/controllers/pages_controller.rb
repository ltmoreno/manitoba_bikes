class PagesController < ApplicationController
  def permalink
    @page = Page.find_by(permalink: params[:permalink])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:title, :content, :permalink)
  end

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
