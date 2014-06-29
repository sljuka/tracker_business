require './runners/runner'

module JobRunner

  class FinishJob < Runner

    def run(job_id)
      job = repo.find_job(job_id)
      job.finish_job(self)
    end

  end

end