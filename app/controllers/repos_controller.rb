class ReposController < ApplicationController
  require 'will_paginate/array'
  def index
    @available = Repository.all.pluck(:vat)
    @unknowns = Response.where.not(vat: Repository.pluck(:vat)).pluck(:vat).uniq
    @repos = (@available + @unknowns) #.paginate(page: params[:page], per_page: 15)
  end

  def show
    @repo = Repository.find_by_vat(params[:id])
    @responses = Response.where(vat: params[:id])
    if @repo.nil?
      puts "get======================"
      puts @responses.first.list + "/" + params[:id] + "/quest_json"
      lookup = HTTParty.get(@responses.first.list + "/" +
        params[:id] + "/quest_json")
      if lookup.success?
        @repo = Repository.create(name: lookup[0]['name'],
                                  vat:  params[:id])
      end
    end
  end
end
