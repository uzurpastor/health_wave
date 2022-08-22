ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :category, :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :category, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :category
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :category
    end
    f.actions
  end
  show do 
    attributes_table do
      row :name
      row :email
      row :category
    end
    active_admin_comments
  end
end
