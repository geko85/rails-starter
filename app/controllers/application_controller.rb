class ApplicationController < ActionController::Base
  include ApplicationHelper

  def bootstrap
  end

  def benchmark
    @iterations = (params[:iterations]||5).to_i
    @data = [
      {
        a: "Row 0, Column A",
        b: "Row 0, Column B",
        c: rand(1000)
      },
      {
        a: "Row 1, Column A",
        b: "Row 1, Column B",
        c: rand(1000)
      },
      {
        a: "Row 2, Column A",
        b: "Row 2, Column B",
        c: rand(1000)
      },
      {
        a: "Row 3, Column A",
        b: "Row 3, Column B",
        c: rand(1000)
      },
      {
        a: "Row 4, Column A",
        b: "Row 4, Column B",
        c: rand(1000)
      }
    ]
  end

end
