module ApplicationHelper
#Return a title on a page
def title
	base_title="Have Fun"
	if @title.nil?
	base_title
	else
	"#{base_title} | #{@title}"
	end
end

end
