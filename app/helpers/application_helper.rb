module ApplicationHelper

  def table(rows: [])
    content_tag(:table, class: "table table-sm") do
      content_tag(:tbody) do
        rows.collect do |row|
          content_tag(:tr) do
            row.collect do |key, value|
              concat content_tag(:td, value)
            end
          end
        end.join.html_safe
      end
    end
  end

end
