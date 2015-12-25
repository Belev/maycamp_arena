class AddContestsToGroups < ActiveRecord::Migration
  def change
    contest_groups = {
      "контролно" => "Контролни",
      "арена" => "Арени",
      "турнир" => "Турнири",
      "състезание" => "Състезания",
      "нои" => "Национални олимпиади",
      "io" => "Международни олимпиади",
      "oi" => "Международни олимпиади"
    }

    contest_groups.each do |search_name, name|
      contest_group = ContestGroup.find_or_create_by(name: name)
      contests = Contest.where("name LIKE ?", "%#{search_name}%")
      contests.each { |contest| contest.update(contest_group: contest_group) }
    end

    contests_without_group = Contest.where(contest_group_id: nil)
    other_group = ContestGroup.find_or_create_by(name: "Други")

    contests_without_group.each { |contest| contest.update(contest_group: other_group)}
  end
end
