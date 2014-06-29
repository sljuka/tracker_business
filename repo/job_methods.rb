module Repo
  module JobMethods

    def find_job(id)
      jobs = Struct.new(:id, :finished) do
        def finish_job(id)
          puts "Job finished"
        end
      end

      j = jobs.new(1, false)
    end

    def create_job(job_params)

    end

    def new_job(job_params)

    end

    def update_job(job_params)

    end

    def delete_job(id)

    end

    def query_jobs(query_params)

    end

    def save_job(project)

    end

  end
end