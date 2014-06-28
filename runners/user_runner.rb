require './runners/runner'

module UserRunner

  class CreateProject < Runner

    def run(user_id, project_params)
      repo.find_user(user_id).create_project(project_params)
    end

  end

end