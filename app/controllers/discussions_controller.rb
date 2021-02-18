class DiscussionsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @project = Project.find(params[:project_id])
        @discussions = @project.discussions.paginate(page: params[:page], per_page: 3)
    end

    def new
        @discussion = Discussion.new
        @project = Project.find(params[:project_id])

    end

    def create
        project = Project.find(params[:project][:id])
        @discussion = Discussion.new(discussion_params)
        @discussion.project = project
        
        if @discussion.save
            flash[:notice] = "Created the Discussion successfully!"
            redirect_to discussion_path(@discussion)
        else
            render "new"
        end
    end

    def show
        @discussion = Discussion.find(params[:id])
        @comment = Comment.new
        @comments = @discussion.comments.order("created_at DESC")
    end

    def edit
        @discussion = Discussion.find(params[:id])
    end

    def update
        @discussion = Discussion.find(params[:id])
        if @discussion.update(discussion_params)
            redirect_to discussion_path(@discussion)
        else
            render "edit"
        end
    end

    def destroy
        @discussion = Discussion.find(params[:id])
        @discussion.destroy
        redirect_to project_path
    end

    private

    def discussion_params
        params.require(:discussion).permit(:title, :description)
    end
end