class TestingController < ApplicationController

  def index
  end

  def test
   render :partial => 'test', :status => 200
  end
  
  def embedd
  
  end
  
end