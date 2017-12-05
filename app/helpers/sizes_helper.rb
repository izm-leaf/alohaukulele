module SizesHelper
  def size_choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_sizes_path
    elsif action_name == 'edit'
      size_path
    end
  end
end
