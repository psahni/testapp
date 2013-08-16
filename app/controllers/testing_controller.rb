class TestingController < ApplicationController


  layout 'templating', :only => [:handlebar]

  def index
  end

  def test
   render :partial => 'test', :status => 200
  end
  
  def embedd
  end
  
  def fbtesting
    
  end

  def handlerbar
  end
  
end
