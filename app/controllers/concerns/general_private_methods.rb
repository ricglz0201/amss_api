# Module for private methods
module GeneralPrivateMethods
  private

  def except_dates
    { except: dates }
  end

  def dates
    %i[created_at updated_at]
  end
end
