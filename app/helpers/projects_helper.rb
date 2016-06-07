module ProjectsHelper
  def list_names_tag(var)
  	content_tag(:tr, class: "user", id: "#{var.id}") do 
  	  content_tag(:td, var.name, class:"name") +
  	  content_tag(:td) do 
  	    content_tag(:a, var.email, class:"email")
  	  end +
  	  content_tag(:td) do
  	  	content_tag(:a, "edit", class: "userlink-edit", id: var.id)
  	  end +
  	  content_tag(:td) do
  	  	content_tag(:a, "delete", class: "userlink-delete", id: var.id)
  	  end 		
  	end
  end
end



# list_names_tag #=>
# <tr>
#   <td><%=user.name%></td>
#   <td><a href="#"><%=user.email%></a></td>
#   <td>edit destroy</td>
# </tr>
	
