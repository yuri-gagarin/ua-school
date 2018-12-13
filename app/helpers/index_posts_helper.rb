module IndexPostsHelper
    def nested_index_post_path(post)
        "/" + (post.ancestors + [post]).map(&:to_param).join("/")
    end
end
