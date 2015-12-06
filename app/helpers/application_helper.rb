module ApplicationHelper
  def full_title page_title = ""
    base_title = t "helpers.base_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def link_to_remove_fields name, f
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields name, f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object,
      child_index: "new_#{association}") do |builder|
      render association.to_s.singularize + "_fields", f: builder
    end
    link_to_function name,
      "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"
  end

  def link_to_function name, function, html_options={}
    onclick = "#{"#{html_options[:onclick]}; " if
      html_options[:onclick]}#{function}; return false;"
    href = html_options[:href] || '#'
    content_tag :a, name, html_options.merge(href: href, onclick: onclick)
  end
end

