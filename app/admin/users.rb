ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :phone, :name, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:phone, :name, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
    end
    f.actions
  end
  show do 
    attributes_table do
      row :name
      row :email
      row :phone
    end
    active_admin_comments
  end
end

end
