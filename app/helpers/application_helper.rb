module ApplicationHelper
  def unique_dom_id(f)
    parent = ''
    if f.options[:parent_builder].present?
      parent = "#{unique_dom_id(f.options[:parent_builder])}_"
    end
    return "#{parent}#{dom_class(f.object)}_#{f.index}"
  end
end
