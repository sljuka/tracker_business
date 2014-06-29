require 'rspec/given'
require File.join(File.dirname(__FILE__), '../business/job')
require File.join(File.dirname(__FILE__), '../runners/job_runner')

describe JobRunner do 

  Given(:job_raw) { double(id: 1, type: "chore", :'finished=' => true, :'biz?' => false) }
  Given(:job) { Business::Job.wrap(job_raw) }
  Given(:repo) { double(find_job: job, save_job: true) }
  Given(:context) { double(repo: repo) }
  Given(:runner) { JobRunner::FinishJob.new(context) }

  When { runner.run(job.id) }

  Then { expect(job_raw).to have_received(:finished=).with(true) }
  Then { expect(repo).to have_received(:save_job).with(job) }
  Then { expect(runner).to receive(:success).with("Chore finished") }

end