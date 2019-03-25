module AttachmentHelper
  
  def search_by(tag_names)
    arr = []
    tag_names.split("-").each do |tags|
      if tags.include?("+")
        arr = tags.split("+").reject { |e| e.empty? }
      end
    end
    return arr
  end
end