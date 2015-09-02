ThinkingSphinx::Index.define :band, :with => :active_record do
  indexes :name, :sortable => true
end