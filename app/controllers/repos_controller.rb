class ReposController < ApplicationController
  def show
    @repo = Response.find(params[:id])
    @responses = Response.where(quest_id: @repo.quest_id)
  end
end
