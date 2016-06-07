module ProjectsHelper
  def list_names_tag(var)
  	content_tag(:tr) do 
  	  content_tag(:td, var.name) +
  	  content_tag(:td) do 
  	    content_tag(:a, var.email)
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
	
