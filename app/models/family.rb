class Family < ApplicationRecord
  has_many :crops

  enum nitrogen: { fixing: 0, neutral: 1, depleting: 2 }
  enum biomass: { hi_biomass: 0, medium_biomass: 1, low_biomass: 2 }
  enum weed_competition: { suppressing: 0, competing: 1, yielding: 2 }
  enum erosion: { low_run_off: 0, medium_run_off: 1, high_run_off: 2 }
  enum root_structure: { deep: 0, med_depth: 1, shallow: 2 }
end