module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def popular_tags
    tags = Post.tag_counts_on(:tags)
    tag_cloud(tags, %w(size1 size2 size3 size4)) do |tag, css_class|
      concat link_to(tag.name, posts_path(tag: tag.name), class: css_class)
    end
    nil
  end
end
