require './business/user'
require './business/member'
require './business/project'
require './runners/user_runner'

describe UserRunner::CreateProject do

  let(:user_raw) { double(id: 1, biz?: false) }
  let(:user) { Business::User.wrap(user_raw) }

  let(:project_raw) { double(id: 1, biz?: false, :'user_id=' => true) }
  let(:project) {Business::Project.wrap(project_raw)}

  let(:member_raw) { double(id: 1, biz?: false, :'user_id=' => true) }
  let(:member) { Business::Member.wrap(member_raw) }

  let(:repo) { double(find_user: user, save_job: true, new_project: project, new_member: member) }
  let(:context) { double(repo: repo) }
  let(:runner) { UserRunner::CreateProject.new(context) }

  it "runs the create project method" do

    expect(project).to receive(:created_by=).with(user.id)
    expect(repo).to receive(:save_project).with(project)
    expect(member).to receive(:project_id=).with(project.id)
    expect(member).to receive(:user_id=).with(user.id)
    expect(repo).to receive(:save_member).with(member)

    runner.run(user.id, name: "test project")

  end

end