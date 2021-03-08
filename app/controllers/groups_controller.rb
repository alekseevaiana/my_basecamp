class GroupsController < ApplicationController
    before_action :authenticate_user!

    def create
        @project = Project.find(params[:project_id])
        user = User.find_by(email: params[:email])
        puts "#{@project.users} EXISTS"
        if @project.users.include?(user)
            puts "EXISTS"
            flash[:notice] = "This user already exists"
            redirect_to project_path(@project)
        elsif user.present?
            group = Group.new(user_id: user.id, project_id: @project.id)
            @permitions = params[:permitions]
            puts "BEFORE PERMITION IF"
            if @permitions != nil
                if @permitions.include? "write"
                    puts "INSIDE PERMITION write"
                    group.can_write = true
                end
                if @permitions.include? "read"
                    puts "INSIDE PERMITION read"
                    group.can_read = true
                end
                if @permitions.include? "update"
                    puts "INSIDE PERMITION update"
                    group.can_update = true
                end
                if @permitions.include? "delete"
                    puts "INSIDE PERMITION delete"
                    group.can_delete = true
                end
            end

            if params[:role] == "admin"
                group.is_admin = true
            else
                group.is_admin = false
            end

            group.save

            flash[:notice] = "Added user successfully"
            redirect_to project_path(@project)
        else
            flash[:alert] = "User email address doesn't exist"
            redirect_to project_path(@project)
        end
    end

    def destroy
        project = Project.find(params[:project_id])
        group = Group.find_by(user_id: params[:user_id], project_id: params[:project_id])

        if group.destroy
            flash[:notice] = "Removed user successfully"  
            redirect_to project_path(project)
        end
    end
end