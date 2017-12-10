module FavoritesHelper
  def fav_choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_favorites_path
    elsif action_name == 'edit'
      favorite_path
    end
  end
end
