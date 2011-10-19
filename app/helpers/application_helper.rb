module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "VMS Lyte"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("vmslytelogo.png", :alt => "VMS Lyte", :class => "round")
  end

end