module FinishJobSupport
  class FinishChore

    def finish_job(context, job)
      job.finished = true
      if context.repo.save_job(job)
        context.success("Chore finished")
      else
        context.failure("Chore not finished")
      end
    end

  end
end