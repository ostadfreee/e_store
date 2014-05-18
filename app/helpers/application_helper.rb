module ApplicationHelper
  def error_messages_for(object)
    render(:partial => 'application/error_messages',
      :locals => {:object => object})
  end
 
   
	def full_title(page_title)
    base_title = "Admin"
    if page_title.empty?
      base_title
    else
      "#{base_title} / #{page_title}"
    end
  end
  def full_header(page_header)
    base_header = ""
    if page_header.empty?
      base_header
    else
      "#{base_header}  #{page_header}"
    end
  end
end 
 

