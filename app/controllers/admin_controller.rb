class AdminController < ApplicationController
    def newsletter
        if !signed_in?
            redirect_to root_path
        end
        @newsletters = Newsletter.all
    end

    def projects
        if !signed_in?
            redirect_to root_path
        end
        @projects = Project.all
    end

    def gallery
        if !signed_in?
            redirect_to root_path
        end
        @galleries = Gallery.all
    end

    def image
        if !signed_in?
            redirect_to root_path
        end
        @gallery =Gallery.find(params[:format])
        @images = @gallery.images
    end

    def status
        if !signed_in?
            redirect_to root_path
        end
        @status = Status.all
    end
end
