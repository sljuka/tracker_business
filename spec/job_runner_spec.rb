require File.join(File.dirname(__FILE__), '../business/job')
require File.join(File.dirname(__FILE__), '../runners/job_runner')

describe JobRunner do 

  let(:job_raw) { double(id: 1, type: "chore", :'finished=' => true, :'biz?' => false) }
  let(:job) { Business::Job.wrap(job_raw) }
  let(:repo) { double(find_job: job, save_job: true) }
  let(:context) { double(repo: repo) }
  let(:runner) { JobRunner::FinishJob.new(context) }

  context "when job is a chore" do
    it "runs the finish chore method" do
      expect(job_raw).to receive(:finished=).with(true)
      expect(repo).to receive(:save_job).with(job)
      expect(runner).to receive(:success).with("Chore finished")

      runner.run(job.id)
    end
  end

  context "when job is a bug" do
    it "runs the finish bug method" do
      allow(job_raw).to receive(:type).and_return("bug")

      expect(job_raw).to receive(:finished=).with(true)
      expect(repo).to receive(:save_job).with(job)
      expect(runner).to receive(:success).with("Bug squashed!")

      runner.run(job.id)
    end
  end

  context "when job is a feature" do
    it "runs the finish feature method" do
      allow(job_raw).to receive(:type).and_return("feature")

      expect(job_raw).to receive(:finished=).with(true)
      expect(repo).to receive(:save_job).with(job)
      expect(runner).to receive(:success).with("Feature finished")

      runner.run(job.id)
    end
  end

end