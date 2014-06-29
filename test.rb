require_relative 'mock_repo'
require_relative 'runners/job_runner'


m = MockRepo.new
Context = Struct.new(:repo)
context = Context.new(m)
runner = JobRunner::FinishJob.new(context)
runner.run(1)