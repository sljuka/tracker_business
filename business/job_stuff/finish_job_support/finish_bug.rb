module FinishJobSupport
  class FinishBug

    def finish_job(context, job)
      job.finished = true
      if context.repo.save_job(job)
        context.success("Bug squashed!")
      else
        context.failure("Bug still alive")
      end
    end

  end
end
