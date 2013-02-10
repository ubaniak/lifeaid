class PagesController < ApplicationController
    def home
        @newsletters = Newsletter.all
        @projects = Project.all
    end

    def about
    end

    def contact
        @users = User.all
    end

    def donate
    end

    def newsletter
        @newsletter = Newsletter.last
    end

    def projects
    end

    def admin
        if !signed_in?
            redirect_to root_path
        end
        @newsletters = Newsletter.all
        @projects = Project.all
        @galleries = Gallery.all
    end

    def photos
        @galleries = Gallery.all
        @count = 1
    end
end
