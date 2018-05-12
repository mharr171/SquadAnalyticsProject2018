module SquadsHelper

	def sort_link(column, title = nil)
    title ||= column.titleize
		# title = "UID" if title == "Uid"
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "fas fa-sort-up" : "fas fa-sort-down"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <i class='#{icon}'></i>".html_safe, {column: column, direction: direction}
  end
end

