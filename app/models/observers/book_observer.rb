class BookObserver < ActiveRecord::Observer

  def after_update(model)
    puts "============================================="
    Rails.logger.info model.inspect
  end

end
