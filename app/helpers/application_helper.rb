module ApplicationHelper
    def title
        base_title = "Life aid Zambia"
        if @title.nil?
            base_title
        else
            "#{base_title} | #{@title}"
        end
    end

    def logo
        image_tag("images/logo.png", :alt => "life aid", :class => "logo", :width =>300)
    end
end
