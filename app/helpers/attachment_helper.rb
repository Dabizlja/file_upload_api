module AttachmentHelper
  def filter_tag_list(names)
    if names.size > 1
      names.map do |name|
        if name.include?("+") || name.include?("-")
          name.gsub!(/[+-]/, "")
        end
      end
    end
  end
end