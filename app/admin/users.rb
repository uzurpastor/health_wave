# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :phone, :name, :email

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
