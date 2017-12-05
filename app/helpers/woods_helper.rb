module WoodsHelper
  def wood_choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_woods_path
    elsif action_name == 'edit'
      wood_path
    end
  end
end
