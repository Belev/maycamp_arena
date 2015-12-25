class ContestGroupsController < ApplicationController
  def show
    @contest_group_name = ContestGroup.find(params[:id]).name
    @contests = Contest.
        paginate(page: params[:page], per_page: 20).
        where(contest_group_id: params[:id], visible: true, practicable: true).
        order(end_time: :desc)
  end
end
