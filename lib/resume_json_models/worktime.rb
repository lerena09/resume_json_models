module ResumeJsonModels
  
  class Worktime
    include JsonModel
    include ActiveModel::Validations
    include ActiveModel::Conversion  
    extend  ActiveModel::Naming
    
    FULL_TIME       = 1
    PART_TIME       = 2
    BY_DEMAND       = 4
    EVENING_WEEKEND = 8
    
    attribute :types, Bitfield, :default => 0   # A bitmap representing the worktime types that are relevant for the listed position.
    attribute :text,  String                    # An additional description of the worktime.
    
    validates :types, :numericality => {
      :greater_than => -1,
      :message      => I18n.t("worktime.error_msg")
    }
    
  end

end
