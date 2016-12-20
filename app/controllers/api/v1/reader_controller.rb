class Api::V1::ReaderController < ApplicationController
  def create
    read = Read.new(read_params)
    if read.save
      render json: {
         status: 201,
         message: "Successfully created read",
       }.to_json
    else
      render json: {
         status: 400,
         message: "Read not saved",
       }.to_json
    end
  end

  private
    def read_params
      {
        title: params[:title],
        url: params[:url],
        submitter_name: params[:submitter]
      }
    end
end
