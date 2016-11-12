module ApplicationHelper
  def to_absalom_reckoning(date)
    return '' unless date
    year = date.year + 2700
    I18n.l(date, format: "%A %e %B #{year}")
  end

  def my_character?(player_character)
    player_character.player == current_user
  end

  def player_options
    User.all.map { |player| [player.email, player.id] }
  end

  def destroy_link_for(object)
    return unless object.persisted?
    return unless policy(object).destroy?

    link_to 'Delete', object, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger'
  end

  def edit_link_for(object)
    return unless object.persisted?
    return unless policy(object).edit?

    link_to 'Edit', polymorphic_path([:edit, object]), class: 'btn btn-info'
  end
end
