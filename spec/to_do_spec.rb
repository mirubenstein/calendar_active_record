describe ToDo do

  it { should have_db_column :name }
  it { should have_many :notes }

end
