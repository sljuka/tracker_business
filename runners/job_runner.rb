require './runners/runner'

module JobRunner

  class FinishJob < Runner

    def run(job_id)
      repo.find_job(job_id).finish_job(self)
    end

  end

end