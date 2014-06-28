require './business/model'

module Business

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
  
  class Job < Model

    JOB_FINISH_HASH = {
      "chore"   => FinishChore,
      "bug"     => FinishBug,
      "feature" => FinishFeature
    }

    def finish_job(context)
      finisher = JOB_FINISH_HASH[self.type].new
      finisher.finish_job(context, self)
    end

  end

end