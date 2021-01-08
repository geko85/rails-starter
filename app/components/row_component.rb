class RowComponent < ViewComponent::Base

  attr_reader :columns
  def initialize(columns:)
    @columns = columns
  end

end