class AddNotNullContestGroupIdToContests < ActiveRecord::Migration
  def change
    change_column_null :contests, :contest_group_id, false
  end
end
