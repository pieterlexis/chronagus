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
end
