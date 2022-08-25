# frozen_string_literal: true

ActiveAdmin.register Doctor do
  permit_params :email, :category_id, :name

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
