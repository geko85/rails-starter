class TableComponent < ViewComponent::Base
  include ViewComponent::SlotableV2

  renders_many :rows, RowComponent

end