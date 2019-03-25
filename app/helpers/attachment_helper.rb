module AttachmentHelper
  def search_permitted_tags(tag_names)
    tag_names.split("-").each do |tags|
      if tags.include?("+")
        return tags.split("+").reject { |e| e.empty? }
      end
    end
  end

  def exclude_search(tag_names)
    tag_names.split(/[+, -]/).reject { |e| e.empty? }
  end
end