Dir["repo/*.rb"].each {|file| require_relative file }

class MockRepo

  include Repo::UserMethods
  include Repo::ProjectMethods
  include Repo::MemberMethods
  include Repo::JobMethods

end