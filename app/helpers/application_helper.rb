module ApplicationHelper

  def bootstrap_control(f, label, options = {})
    content_tag("div", :class => "control-group") do
      f.label(label, :class => "control-label") +
      content_tag("div", :class => "controls") do
        yield
      end
    end
  end

  def bootstrap_checkboxes(group_name, options)
    result = options.map do |name, id|
      content = "#{check_box_tag(group_name, id)} #{name}"
      content_tag("label", raw(content), :class => "checkbox")
    end
    return result.join("") 
  end

end
