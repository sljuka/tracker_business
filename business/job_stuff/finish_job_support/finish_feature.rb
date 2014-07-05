module FinishJobSupport 
  class FinishFeature

    def finish_job(context, job)
      job.finished = true
      if context.repo.save_job(job)
        context.success("Feature finished")
      else
        context.failure("Feature not finished")
      end
    end

  end
end
