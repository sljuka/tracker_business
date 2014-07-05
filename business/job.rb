require './business/model'
require './business/job_stuff/finish_job_support/finish_bug'
require './business/job_stuff/finish_job_support/finish_chore'
require './business/job_stuff/finish_job_support/finish_feature'
require './business/job_stuff/job_constants'

module Business
  
  class Job < Model

    include JobStuff::JobConstants

    JOB_FINISH_HASH = {
      JOB_TYPES[:chore]   => FinishJobSupport::FinishChore,
      JOB_TYPES[:bug]     => FinishJobSupport::FinishBug,
      JOB_TYPES[:feature] => FinishJobSupport::FinishFeature
    }

    def finish_job(context)
      finisher = JOB_FINISH_HASH[self.type].new
      finisher.finish_job(context, self)
    end

  end

end