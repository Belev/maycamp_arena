class Admin::ContestGroupsController < Admin::BaseController
  def index
    authorize :contest_group

    @contest_groups = ContestGroup.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    authorize :contest_group

    @contest_group = ContestGroup.new
  end

  def create
    authorize :contest_group

    @contest_group = ContestGroup.new(contest_group_params)

    if @contest_group.save
      flash[:notice] = "Групата е създадена успешно."
      redirect_to admin_contest_groups_path
    else
      render :action => "new"
    end
  end

  def edit
    authorize :contest_group

    @contest_group = ContestGroup.find(params[:id])
  end

  def update
    authorize :contest_group

    @contest_group = ContestGroup.find(params[:id])

    if @contest_group.update_attributes(contest_group_params)
      flash[:notice] = "Групата е обновена успешно."
      redirect_to edit_admin_contest_group_path(@contest_group)
    else
      render :action => "edit"
    end
  end

  def destroy
    authorize :contest_group

    contest_group = ContestGroup.find(params[:id])

    if contest_group.contests.count > 0
      flash[:error] = "Групата не може да бъде изтрита, защото не е празна."
      render :action => "index"
    else
      contest_group.destroy
      flash[:notice] = "Групата беше успешно изтрита."
      redirect_to admin_contest_groups_path
    end
  end

  private

  def contest_group_params
    params.require(:contest_group).permit(:name)
  end
end
