class ReaderController < ApplicationController
  def index
    @reads = Read.most_current
  end
end
