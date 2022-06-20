class ProjectInvestigator < ApplicationRecord
    belongs_to :project
    belongs_to :investigator
end
