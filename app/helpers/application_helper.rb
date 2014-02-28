module ApplicationHelper

  def test
    logger.info "============================================"
    logger.info @template.inspect
  end


end
