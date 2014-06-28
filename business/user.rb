require './business/model'

module Business
  class User < Model

    def create_project(project_params, context)

      project = context.repo.new_project(project_params)
      project.created_by = self.id

      unless context.repo.save_project(project)
        context.failure("Unable to save project")
      end

      member = context.repo.new_member
      member.project_id = project.id
      member.user_id = self.id

      if context.repo.save_member(member)
        context.success(project, "Project created successfully")
      else
        context.failure("Unable to save project member")
      end        
    
    end
  end 
end