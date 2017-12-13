module UkulelesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_ukuleles_path
    elsif action_name == 'edit'
      ukulele_path
    end
  end

  def choose_new_or_edit2
    if action_name == 'new' || action_name == 'confirm'
      ukuleles_path
    elsif action_name == 'edit'
      ukulele_path
    end
  end
end
