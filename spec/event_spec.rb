require 'spec_helper'

describe Event do
  it { should have_db_column :name }
  it { should have_db_column :location }
  it { should have_db_column :start_date }
  it { should have_db_column :end_date }

  describe 'list_by_date' do
    it 'should list all events by date' do
      test_event = Event.create(:name => 'birthday', :location => 'home', :start_date => '2015/09/05', :end_date => '2015/09/06 12:00:00')
      test_event2 = Event.create(:name => 'birthday', :location => 'home', :start_date => '2014/02/02', :end_date => '2014/09/06 12:00:00')
      test_event3 = Event.create(:name => 'birthday', :location => 'home', :start_date => '2015/09/03', :end_date => '2015/09/04 12:00:00')
      expect(Event.list_by_date).to eq [test_event3, test_event]
    end
  end

  describe 'view_day' do
    it 'should view all of the events for the current day' do
      test_event = Event.create(:name => 'birthday', :location => 'home', :start_date => '2015/09/05', :end_date => '2015/09/06 12:00:00')
      test_event2 = Event.create(:name => 'birthday', :location => 'home', :start_date => '2014/02/02', :end_date => '2014/09/06 12:00:00')
      test_event3 = Event.create(:name => 'birthday', :location => 'home', :start_date => '2014/08/14', :end_date => '2015/09/04 12:00:00')
      expect(Event.view_day).to eq [test_event3]
    end
  end

  describe 'view_month' do
    it 'should view all of the events for the current month' do
      test_event = Event.create(:name => 'birthday', :location => 'home', :start_date => '2014/08/20', :end_date => '2015/09/06 12:00:00')
      test_event2 = Event.create(:name => 'birthday', :location => 'home', :start_date => '2014/02/02', :end_date => '2014/09/06 12:00:00')
      test_event3 = Event.create(:name => 'birthday', :location => 'home', :start_date => '2014/08/14', :end_date => '2015/09/04 12:00:00')
      expect(Event.view_month).to eq [test_event3, test_event]
    end

  end

  describe 'view_year' do
    it 'should view all of the events for the current year' do
      test_event = Event.create(:name => 'birthday', :location => 'home', :start_date => '2015/09/05', :end_date => '2015/09/06 12:00:00')
      test_event2 = Event.create(:name => 'birthday', :location => 'home', :start_date => '2014/02/02', :end_date => '2014/09/06 12:00:00')
      test_event3 = Event.create(:name => 'birthday', :location => 'home', :start_date => '2014/08/14', :end_date => '2015/09/04 12:00:00')
      expect(Event.view_year).to eq [test_event2, test_event3]
    end
  end
end
